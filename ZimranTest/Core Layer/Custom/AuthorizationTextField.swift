//
//  AuthorizationTextField.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import UIKit

final class AuthorizationTextField: UITextField, UITextFieldDelegate {
    
    private let edgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
    
    var onClick = false
    
    lazy var eyeButton: UIButton = {
        let eyeButton = UIButton()
        eyeButton.setImage(.init(named: "EyeButton"), for: .normal)
        eyeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        eyeButton.addTarget(self, action: #selector(showText), for: .touchUpInside)
        return eyeButton
    }()
    
    init(placeholder: String){
        super.init(frame: .zero)
        setupTF(placeholder: placeholder)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.inset(by: edgeInsets)
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.zmPrimaryBlue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.zmLightGray.cgColor
    }
    
    private func setupTF(placeholder: String){
        let PlaceholderText = NSAttributedString(string: placeholder,
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.zmDarkGray,
                                                              NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 16)!])
                            

                
        self.attributedPlaceholder = PlaceholderText
        self.layer.borderColor = UIColor.zmLightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.delegate = self
        setupButton()
        
    }
    
    private func setupButton() {
        self.rightViewMode = .always
        self.rightView = eyeButton
        
    }
    
    @objc func showText() {
        if onClick {
                self.isSecureTextEntry = false
                eyeButton.setImage(UIImage(named: "EyeButtonRev"), for: .normal)
            } else {
                self.isSecureTextEntry = true
                eyeButton.setImage(UIImage(named: "EyeButton"), for: .normal)
            }
            onClick = !onClick
    }
    
}

//extension AuthorizationTextField {
//    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
//            self.endEditing(true)
//    }
//}
