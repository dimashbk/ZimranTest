//
//  myButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import UIKit

final class MyButton: UIButton {

    init(title: String, fontSize: Int){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font =  UIFont(name: "Inter-SemiBold", size: CGFloat(fontSize))
        self.titleLabel?.textColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
