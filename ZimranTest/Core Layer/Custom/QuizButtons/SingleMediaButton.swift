//
//  SingleMediaButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit

class SingleMediaButton: UIButton {
    
    var delegate: ButtonStateProtocol?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.text = "Choise"
        
        return label
    }()
    
    private lazy var stateImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .init(named: "Test")
            
            return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        changeState(state: .rest)
        setup()
        addTarget(self, action: #selector(checkState), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [label, stateImageView].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        stateImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(56)
        }
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stateImageView.snp.bottom).offset(44)
        }
        
    }
    
    func changeState(state: ButtonStates) {
        
        switch state {
        case .rest:
            backgroundColor = .white
            layer.cornerRadius = 8
            layer.borderWidth = 1
            layer.borderColor = UIColor.zmGrayQuizChoises.cgColor
        case .selected:
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.zmPrimaryBlue.cgColor
            self.backgroundColor = UIColor.zmSelectedQuizChoises
        case .correct:
            print("correct")
        case .incorrect:
            print("incorrect")
        }
        
    }
    
    @objc func checkState() {
        isSelected = true
        self.delegate?.setOnClickButton(button: self)
    }

}
