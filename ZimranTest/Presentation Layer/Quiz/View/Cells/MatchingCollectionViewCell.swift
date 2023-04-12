//
//  MatchingCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 08.04.2023.
//

import UIKit

final class MatchingCollectionViewCell: UICollectionViewCell, ButtonStateProtocol , SecondButtonStateProtocol {
    
    override class func description() -> String {
        return "MatchingCollectionViewCell"
    }
    var isCorrect = false
    var correctAnswerCount = 0
    
    var onClickFirstButton = UIButton()
    var onClickSecondButton = UIButton()
    
    var getCorrectnessDelegate: GetCorrectness?
    var matchingViewModel = MatchingViewModel()
    var buttonsOrdering = ButtonsOrdering()
    
    
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    lazy var firstImageButton: MatchingButton = {
        let button = MatchingButton()
        button.myImageView.isHidden = false
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondImageButton: MatchingButton = {
        let button = MatchingButton()
        button.myImageView.isHidden = false
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var thirdImageButton: MatchingButton = {
        let button = MatchingButton()
        button.myImageView.isHidden = false
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var fourthImageButton: MatchingButton = {
        let button = MatchingButton()
        button.myImageView.isHidden = false
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var fifthImageButton: MatchingButton = {
        let button = MatchingButton()
        button.myImageView.isHidden = false
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var firstLabelButton: MatchingButton = {
        let button = MatchingButton()
        button.type = 2
        button.label.isHidden = false
        button.secondDelegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        
        return button
    }()
    
    lazy var secondLabelButton: MatchingButton = {
        let button = MatchingButton()
        button.type = 2
        button.label.isHidden = false
        button.secondDelegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var thirdLabelButton: MatchingButton = {
        let button = MatchingButton()
        button.type = 2
        button.label.isHidden = false
        button.secondDelegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var fourthLabelButton: MatchingButton = {
        let button = MatchingButton()
        button.type = 2
        button.label.isHidden = false
        button.secondDelegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    lazy var fifthLabelButton: MatchingButton = {
        let button = MatchingButton()
        button.type = 2
        button.label.isHidden = false
        button.secondDelegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        
        return button
    }()
    
    override func prepareForReuse() {
        textLabel.text = nil
        for button in [firstImageButton,firstLabelButton,
                                secondImageButton,secondLabelButton,
                                thirdImageButton, thirdLabelButton,
                                fourthImageButton,fourthLabelButton,
                                fifthImageButton,fifthLabelButton] {

            button.isEnabled = true
            button.alpha = 1
            onClickFirstButton.isSelected = false
            onClickSecondButton.isSelected = false
            onClickFirstButton = UIButton()
            onClickSecondButton = UIButton()
            matchingViewModel.correctMatchCount = 0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [textLabel,
         firstLabelButton,
         secondLabelButton,
         thirdLabelButton,
         fourthLabelButton,
         fifthLabelButton,
         firstImageButton,
         secondImageButton,
         thirdImageButton,
         fourthImageButton,
         fifthImageButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(16)
        }
        firstImageButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        secondImageButton.snp.makeConstraints { make in
            make.top.equalTo(firstImageButton.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        thirdImageButton.snp.makeConstraints { make in
            make.top.equalTo(secondImageButton.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        fourthImageButton.snp.makeConstraints { make in
            make.top.equalTo(thirdImageButton.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        fifthImageButton.snp.makeConstraints { make in
            make.top.equalTo(fourthImageButton.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        firstLabelButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        secondLabelButton.snp.makeConstraints { make in
            make.top.equalTo(firstLabelButton.snp.bottom).offset(12)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        thirdLabelButton.snp.makeConstraints { make in
            make.top.equalTo(secondLabelButton.snp.bottom).offset(12)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        fourthLabelButton.snp.makeConstraints { make in
            make.top.equalTo(thirdLabelButton.snp.bottom).offset(12)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
        fifthLabelButton.snp.makeConstraints { make in
            make.top.equalTo(fourthLabelButton.snp.bottom).offset(12)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo((contentView.bounds.width - 42) / 2)
            make.height.equalTo(68)
        }
    }
    func configureCell(choises: [Choice], questionText: String) {
        self.textLabel.text = questionText
        for (index, option) in [firstImageButton,firstLabelButton,
                                secondImageButton,secondLabelButton,
                                thirdImageButton, thirdLabelButton,
                                fourthImageButton,fourthLabelButton,
                                fifthImageButton,fifthLabelButton].enumerated() {
            option.choise = choises[index]
            if choises[index].text.count > 0 {
                let choiseText = choises[index].text
                option.label.text = choiseText
            }
            else {
                let imageURL = URL(string: "\(choises[index].image)")!
                DispatchQueue.global(qos: .userInteractive).async {
                    option.myImageView.kf.setImage(with: imageURL, options: [.processor(SVGImgProcessor())])
                }
            }
        }
    }
    
    func setOnClickButton(button: UIButton) {
        onClickFirstButton = button
    }
    func setOnClickSecondButton(button: UIButton) {
        onClickSecondButton = button
    }
    
    @objc func changeState() {
        [firstImageButton, secondImageButton, thirdImageButton, fourthImageButton , fifthImageButton].forEach { SingleTextButton in
            if SingleTextButton == onClickFirstButton {
                SingleTextButton.changeState(state: .selected)
                buttonsOrdering.imageButton = onClickFirstButton as! MatchingButton
            } else {
                SingleTextButton.changeState(state: .rest)
            }
        }
        [firstLabelButton, secondLabelButton, thirdLabelButton, fourthLabelButton , fifthLabelButton].forEach { SingleTextButton in
            if SingleTextButton == onClickSecondButton {
                SingleTextButton.changeState(state: .selected)
                buttonsOrdering.labelButton = onClickSecondButton as! MatchingButton
            } else {
                SingleTextButton.changeState(state: .rest)
            }
        }
        if buttonsOrdering.imageButton != nil && buttonsOrdering.labelButton != nil {
            matchingViewModel.getResult(buttons: buttonsOrdering)
            
            buttonsOrdering.imageButton = nil
            buttonsOrdering.labelButton = nil
            onClickFirstButton.isEnabled = false
            onClickFirstButton.alpha = 0.2
            onClickSecondButton.isEnabled = false
            onClickSecondButton.alpha = 0.2
            onClickFirstButton = UIButton()
            onClickSecondButton = UIButton()

        }
        getCorrectnessDelegate?.getCorrectBoolean(isCorrect: matchingViewModel.getCorretness(), correctAnswer: "Try again")
    }
}
