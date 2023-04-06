//
//  HomeViewController.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 05.04.2023.
//

import UIKit

final class HomeViewController: UIViewController {

    let viewModel = AuthorizationViewModel()
    
    private lazy var planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "planet1")
        
        return imageView
    }()
    
    private lazy var stocksButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "stockButtonCenter"), for: .normal)
        button.addTarget(self, action: #selector(moveToQuiz), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stocksLabel: UILabel = {
        let label = UILabel()
        label.text = "Stocks"
        label.font = UIFont(name: "Inter-SemiBold", size: 18)
        label.textColor = .white
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        planetImageView.image = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        planetImageView.image = .init(named: "planet1")
    }
    
    private func setup() {
        setupSubviews()
        setupColors()
        setupConstraints()
        setupViews()
        setupNavigationController()
    }
    
    private func setupViews() {
        
    }
    
    private func setupSubviews() {
        [planetImageView, stocksButton, stocksLabel].forEach {
            view.addSubview($0)
        }
    }
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.title = "SIUU"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(signOut))
    }
    
    private func setupColors() {
        view.backgroundColor = .zmPurple
    }
    
    private func setupConstraints() {
        planetImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(106)
        }
        stocksButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(252)
            make.centerX.equalToSuperview()
        }
        stocksLabel.snp.makeConstraints { make in
            make.top.equalTo(stocksButton.snp.bottom).offset(24)
            make.centerX.equalTo(stocksButton.snp.centerX)
        }
    }
   @objc func signOut() {
            navigationController?.popViewController(animated: true)
            Task {
                await viewModel.signOutLocally()
                await viewModel.fetchCurrentAuthSession()
            }
    }
    @objc func moveToQuiz() {
        navigationController?.pushViewController(QuizViewController(), animated: true)
    }
}
