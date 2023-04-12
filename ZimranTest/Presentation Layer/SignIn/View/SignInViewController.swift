//
//  SignInViewController.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import UIKit
import SnapKit
import Amplify

final class SignInViewController: UIViewController {
    
    let authorizationService = AuthorizationService()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = UIFont(name: "Inter-Bold", size: 30)
        label.textColor = .zmDarkBlue
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email address"
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = .zmDarkBlue
        
        return label
    }()
    
    private lazy var emailTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Enter your email")
        textField.eyeButton.isHidden = true
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = .zmDarkBlue
        
        return label
    }()
    
    private lazy var passwordTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Enter password")
        textField.isSecureTextEntry = true
        textField.eyeButton.isHidden = false
        
        return textField
    }()
    
    private lazy var loginButton: MyButton = {
        let button = MyButton(title: "Login", fontSize: 16)
        button.backgroundColor = .zmPrimaryBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        Task {
            await authorizationService.signOutLocally()
//            await authorizationService.signIn(username: "dimash_test_assignment@zimran.io", password: "6f7vTJqLrzm96c3H7Phy3mMa")
        }
    }
    
    
    private func setup() {
        setupViews()
        setupColors()
        setupConstraints()
    }
    
    private func setupViews() {
        [welcomeLabel, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupColors() {
        view.backgroundColor  = .white
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.bounds.width / 2 - 45)
            make.left.equalToSuperview().inset(16)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(16)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(16)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
    }
    
    @objc func signUp() {
        
        let homeVC = HomeViewController()
        Task {
            loginButton.isEnabled = false
            await authorizationService.signIn(username: emailTextField.text ?? "",
                                   password: passwordTextField.text ?? "")
            await authorizationService.fetchAccessToken()
            print(authorizationService.accessToken)
            await authorizationService.fetchAttributes()
            if authorizationService.isSignedIn {
                homeVC.homeViewModel = HomeViewModel(accessToken: authorizationService.accessToken,
                                                     userId: authorizationService.userId)
                navigationController?.pushViewController(homeVC, animated: true)
                loginButton.isEnabled = true
            } else {
                loginButton.isEnabled = true
            }
        }

    }
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
}
