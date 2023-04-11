//
//  Kingfisher Extension.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 11.04.2023.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imageUrl: String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
