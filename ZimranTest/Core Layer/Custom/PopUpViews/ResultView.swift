//
//  ResultView.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 08.04.2023.
//

import UIKit

final class ResultView: UIView {

    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .zmGreen
        return line
    }()
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Amazing"
        label.textColor = .zmGreen
        label.font = UIFont(name: "Inter-SemiBold", size: 20)
        
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "fkfkfkk kfkfkfk fkfkkfkf"
        label.textColor = .zmDarkBlue
        label.font = UIFont(name: "Inter-Medium", size: 14)
        
        
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .zmGreen
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
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
        [firstLabel, secondLabel, continueButton, line].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
        }
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(11)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(52)
        }
        line.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(3)
        }
    }

}
