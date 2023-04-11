//
//  SingleMediaButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit

class SingleMediaButton: UIButton {
    
    var delegate: ButtonStateProtocol?

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        
        return label
    }()
    
    var stateImageView: UIImageView = {
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
//        fetchImage3()
//        let imageURL = "https://via.placeholder.com/150/771796"
//        self.stateImageView.setImage(imageUrl: imageURL)
    }
    
    private func setupSubviews() {
        [label, stateImageView].forEach {
            addSubview($0)
        }
    }
    func fetchImage3(){
        let imageURL = URL(string: "https://d16u1tlpnq9jj6.cloudfront.net/choices/3652543b-dbea-4865-b482-05c70d00e663_742001ae-bd27-4b33-a2cf-d40ef6d807df_d6369b90-7d96-401b-8d9d-857739d14f14_5ef914bb-9d51-4766-acda-dbc9d83059de_460d4ef4-b715-4658-8879-14270d3e7c54.svg")!
            stateImageView.kf.setImage(with: imageURL, options: [.processor(SVGImgProcessor())])
    }
    
    private func setupConstraints() {
        stateImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(64)
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


