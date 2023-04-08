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
    
    var onClickFirstButton = UIButton()
    var onClickSecondButton = UIButton()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "dkdk dkkdk dkfn"
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
        [myLabel,
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
        myLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(16)
        }
        firstImageButton.snp.makeConstraints { make in
            make.top.equalTo(myLabel.snp.bottom).offset(24)
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
            make.top.equalTo(myLabel.snp.bottom).offset(24)
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
            } else {
                SingleTextButton.changeState(state: .rest)
            }
        }
        [firstLabelButton, secondLabelButton, thirdLabelButton, fourthLabelButton , fifthLabelButton].forEach { SingleTextButton in
            if SingleTextButton == onClickSecondButton {
                SingleTextButton.changeState(state: .selected)
            } else {
                SingleTextButton.changeState(state: .rest)
            }
        }
    }
    
    
    
}
