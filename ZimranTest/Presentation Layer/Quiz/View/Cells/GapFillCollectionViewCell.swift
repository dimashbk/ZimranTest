//
//  FillGapCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 12.04.2023.
//

import UIKit

final class GapFillCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "GapFillCollectionViewCell"
    }
    
    var gapFillViewModel = GapFillViewModel()
    
    var getCorrectnessDelegate: GetCorrectness?
    
    var answers = [String]()
    var answersCount = 0
    
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Complete the sentence"
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.numberOfLines = 0
        label.textColor = .zmDarkBlue
        
        return label
    }()
    
    private lazy var firstButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    private lazy var secondButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    firstButtonStackView.arrangedSubviews.forEach { UIView in
        UIView.removeFromSuperview()
    }
    secondButtonStackView.arrangedSubviews.forEach { UIView in
        UIView.removeFromSuperview()
    }
 
    gapFillViewModel = GapFillViewModel()
    answersCount = 0
    answers = [String]()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layer.cornerRadius = 8
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [textLabel, questionLabel, firstButtonStackView, secondButtonStackView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(16)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
        }
        secondButtonStackView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.bottom.equalTo(firstButtonStackView.snp.bottom)
//            make.bottom.equalToSuperview().inset(48)
            make.right.left.equalToSuperview().inset(16)
            
        }
        firstButtonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(24)
            
        }
        secondButtonStackView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.bottom.equalToSuperview().inset(60)
            make.right.left.equalToSuperview().inset(16)
            
        }
        
    }
    
    private func setupFirstButton(_ title: String) {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.zmDarkBlue, for: .normal)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.zmLightGray.cgColor
            button.layer.borderWidth = 0.5
            button.tintColor = .black
            button.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
            firstButtonStackView.addArrangedSubview(button)
        
    }
    private func setupSecondButton(_ title: String) {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
        button.setTitleColor(.zmDarkBlue, for: .normal)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.zmLightGray.cgColor
            button.layer.borderWidth = 0.5
            button.tintColor = .black
            button.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
            secondButtonStackView.addArrangedSubview(button)
        
    }
    
    func configureCell(choises: [Choice], questionText: String) {
        
        
        self.questionLabel.text = questionText
        var text = self.questionLabel.text?.replacingOccurrences(of: "<label>0</label>", with: "____________________", options: .regularExpression)
        text = text?.replacingOccurrences(of: "<label>1</label>", with: "___________________", options: .regularExpression)
        text = text?.replacingOccurrences(of: "<label>2</label>", with: "__________________", options: .regularExpression)
        self.questionLabel.text = text
        if choises.count == 4 {
            for i in 0...(choises.count - 1) {
                setupSecondButton(choises[i].text)
            }
        } else {
            for i in 0...(choises.count - 1) {
                if i > 3 {
                    setupSecondButton(choises[i].text)
                } else {
                    setupFirstButton(choises[i].text)
                }
            }
        }
        gapFillViewModel.getCorrectAnswer(choises: choises)
    }
    @objc func buttonTarget(sender: UIButton) {
        let answer = sender.titleLabel?.text
        if answersCount == 0 {
            let text = self.questionLabel.text?.replacingOccurrences(of: "____________________", with: "\(answer ?? "")", options: .regularExpression)
            self.questionLabel.text = text

            answersCount += 1
            
        } else if answersCount == 1 {
            let text = self.questionLabel.text?.replacingOccurrences(of: "___________________", with: "\(answer ?? "")", options: .regularExpression)
            self.questionLabel.text = text
            answersCount += 1
        } else if answersCount == 2 {
            let text = self.questionLabel.text?.replacingOccurrences(of: "__________________", with: "\(answer ?? "")", options: .regularExpression)
            self.questionLabel.text = text
            answersCount += 1
        }
        if answers.count <  gapFillViewModel.correctAnswer.count {
            self.answers.append(answer ?? "nothing")
        }
        getCorrectnessDelegate?.getCorrectBoolean(isCorrect: gapFillViewModel.getCorretness(answers: answers), correctAnswer: "Try again")
    }
    
}
