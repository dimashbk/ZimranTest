//
//  SingleTextCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit



final class SingleTextCollectionViewCell: UICollectionViewCell , ButtonStateProtocol {
    
    override class func description() -> String {
        return "SingleTextCollectionViewCell"
    }
    
    var onClickButton = UIButton()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    
    
    private lazy var firstButton: SingleTextButton = {
        let button = SingleTextButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: SingleTextButton = {
        let button = SingleTextButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdButton: SingleTextButton = {
        let button = SingleTextButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        return button
    }()
    
    private lazy var fourthButton: SingleTextButton = {
        let button = SingleTextButton()
        button.delegate = self
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layer.cornerRadius = 8
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
            make.width.equalTo(contentView.bounds.width - 32)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(16)
            make.width.equalTo(contentView.bounds.width - 32)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        thirdButton.snp.makeConstraints { make in
            make.top.equalTo(secondButton.snp.bottom).offset(16)
            make.width.equalTo(contentView.bounds.width - 32)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        fourthButton.snp.makeConstraints { make in
            make.top.equalTo(thirdButton.snp.bottom).offset(16)
            make.width.equalTo(contentView.bounds.width - 32)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
    }
    
    func setOnClickButton(button: UIButton) {
        onClickButton = button
    }
    
    @objc func changeState() {
        [firstButton, secondButton, thirdButton, fourthButton].forEach { SingleTextButton in
            if SingleTextButton == onClickButton {
                SingleTextButton.changeState(state: .selected)
            } else {
                SingleTextButton.changeState(state: .rest)
            }
        }
    }
    
}
