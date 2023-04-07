//
//  SingleTextButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit


class SingleTextButton: UIButton {
    
    var delegate: ButtonStateProtocol?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.text = "Choise"
        
        return label
    }()
    
    private lazy var stateImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .init(named: "SingleTextNormal")
            
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
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(14)
        }
        stateImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(14)
        }
    }
    
    func changeState(state: ButtonStates) {
        
        switch state {
        case .rest:
            backgroundColor = .white
            layer.cornerRadius = 8
            layer.borderWidth = 1
            layer.borderColor = UIColor.zmGrayQuizChoises.cgColor
            self.stateImageView.image = .init(named: "SingleTextNormal")
        case .selected:
            self.layer.borderWidth = 1.3
            self.layer.borderColor = UIColor.zmPrimaryBlue.cgColor
            self.backgroundColor = UIColor.zmSelectedQuizChoises
            self.stateImageView.image = .init(named: "SingleTextSelected")
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
