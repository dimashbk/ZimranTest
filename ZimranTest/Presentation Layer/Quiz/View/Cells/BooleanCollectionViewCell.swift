//
//  BooleanCollectionViewCell.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit

final class BooleanCollectionViewCell: UICollectionViewCell {
    
    
    override class func description() -> String {
        return "SingleMediaCollectionViewCell"
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .zmDarkBlue
        label.numberOfLines = 0
        label.font = UIFont(name: "Inter-SemiBold", size: 22)
        
        return label
    }()
    
    private lazy var myImageView() {
        let imageView = UIImageView()
        imaageView.image = .init(named: "")
    }
    
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
        [textLabel, myImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
       
    }

}
