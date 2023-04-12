//
//  ResultScoreView.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 09.04.2023.
//

import UIKit

final class ResultScoreView: UIView {
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .zmGrayQuizChoises
        return line
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Score"
        label.textColor = .zmDarkGray
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmGreen
        
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ispum"
        label.textColor = .zmDarkGray
        label.font = UIFont(name: "Inter-Medium", size: 14)
        
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.zmGrayQuizChoises.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [firstLabel, secondLabel,scoreLabel, line].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.left.equalToSuperview().inset(16)
        }
        scoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.right.equalToSuperview().inset(16)
        }
        line.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
}
