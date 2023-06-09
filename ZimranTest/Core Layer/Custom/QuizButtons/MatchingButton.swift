//
//  MatchingButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 08.04.2023.
//

import UIKit

final class MatchingButton: UIButton {
    
    var delegate: ButtonStateProtocol?
    var secondDelegate: SecondButtonStateProtocol?
    var type = 1
    
    var choise: Choice?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.textColor = .zmDarkBlue
        label.isHidden = true
        
        return label
    }()
    
    lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
            
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
        [label, myImageView].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        myImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(40)
        }
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.zmGreen.cgColor
//            self.backgroundColor = UIColor.zmSelectedQuizChoises
        case .incorrect:
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.zmRed.cgColor
            
        }
        
    }
    
    @objc func checkState() {
        isSelected = true
        if type == 1 {
            self.delegate?.setOnClickButton(button: self)
        } else {
            self.secondDelegate?.setOnClickSecondButton(button: self)
        }
        
    }

}
