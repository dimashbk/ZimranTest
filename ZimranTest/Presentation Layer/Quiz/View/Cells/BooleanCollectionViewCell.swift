//
//  BooleanCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit

final class BooleanCollectionViewCell: UICollectionViewCell {
    
    
    override class func description() -> String {
        return "BooleanCollectionViewCell"
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override func prepareForReuse() {
        textLabel.text = nil
        myImageView.image = nil
    }
    
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
        [textLabel, myImageView].forEach {
            contentView.addSubview($0)
        }
    }
    func configureCell(choises: [Choice], questionText: String, questionImage: String) {
        self.textLabel.text = questionText
        
        if questionImage.count > 1 {
            let imageURL = URL(string: "\(questionImage)")!

            myImageView.kf.setImage(with: imageURL, options: [.processor(SVGImgProcessor())])
        }
        
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(82)
            make.left.right.equalToSuperview().inset(16)
        }
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.height.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
    }

}
