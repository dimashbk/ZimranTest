//
//  SingleMediaCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit
import Foundation

final class SingleMediaCollectionViewCell: UICollectionViewCell, ButtonStateProtocol {
    
    override class func description() -> String {
        return "SingleMediaCollectionViewCell"
    }
    
    var isCorrect = Bool()
    
    var singleMediaViewModel = SingleMediaViewModel()
    
    var getCorrectnessDelegate: GetCorrectness?
    
    var onClickButton = UIButton()
    
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    lazy var firstButton: SingleMediaButton = {
        let button = SingleMediaButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondButton: SingleMediaButton = {
        let button = SingleMediaButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var thirdButton: SingleMediaButton = {
        let button = SingleMediaButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var fourthButton: SingleMediaButton = {
        let button = SingleMediaButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
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
        [textLabel, firstButton, secondButton, thirdButton, fourthButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(16)
        }
        firstButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        thirdButton.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(10)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        fourthButton.snp.makeConstraints { make in
            make.top.equalTo(secondButton.snp.bottom).offset(10)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
    }
    
    func setOnClickButton(button: UIButton) {
        onClickButton = button
    }
    
    func configureCell(choises: [Choice], questionText: String) {
        self.textLabel.text = questionText
        for (index, option) in [firstButton,secondButton,thirdButton,fourthButton].enumerated() {
            let imageURL = URL(string: "\(choises[index].image)")!
            option.stateImageView.kf.setImage(with: imageURL, options: [.processor(SVGImgProcessor())])
            let choiseText = choises[index].text
            option.label.text = choiseText
            singleMediaViewModel.getCorrectAnswer(choises: choises)
           
        }
    }
    
    @objc func changeState() {
        [firstButton, secondButton, thirdButton, fourthButton].forEach { SingleMediaButton in
            if SingleMediaButton == onClickButton {
                SingleMediaButton.changeState(state: .selected)
                getCorrectnessDelegate?.getCorrectBoolean(isCorrect: singleMediaViewModel.getCorretness(chosenButton: onClickButton as! SingleMediaButton), correctAnswer: singleMediaViewModel.correctAnswer)
            } else {
                SingleMediaButton.changeState(state: .rest)
            }
        }
    }
}
