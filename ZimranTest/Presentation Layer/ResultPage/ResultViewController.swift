//
//  ResultViewController.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 09.04.2023.
//

import UIKit
import Lottie

class ResultViewController: UIViewController {
    
    let animationView = LottieAnimationView()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Lesson complete!"
        label.font = UIFont(name: "Inter-SemiBold", size: 24)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var resultScoreView: ResultScoreView = {
        let view = ResultScoreView()
        
        return view
    }()
    
    private lazy var halfView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addSubview(resultScoreView)
        
        
        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(moveToHomeVC), for: .touchUpInside)
        button.backgroundColor = .zmPrimaryBlue
        button.layer.cornerRadius = 8
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupColors()
        setupAnimation()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [label, halfView, animationView, button].forEach {
            view.addSubview($0)
        }
    }
    private func setupColors() {
        view.backgroundColor = .zmPurple
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.centerX.equalToSuperview()
        }
        animationView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(260)
        }
        halfView.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        resultScoreView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(104)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(42)
            make.height.equalTo(52)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    
    private func setupAnimation() {
        animationView.animation = LottieAnimation.named("clap_cosmo")
        animationView.loopMode = .loop
        animationView.backgroundColor = .zmPurple
        animationView.play()
    }
    
    @objc func moveToHomeVC() {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
