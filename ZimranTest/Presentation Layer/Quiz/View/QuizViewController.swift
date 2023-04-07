//
//  QuizViewController.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 06.04.2023.
//

import UIKit

final class QuizViewController: UIViewController {
    
    private lazy var quizCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .zmPrimaryBlue
        collectionView.layer.cornerRadius = 8
        collectionView.register(SingleTextCollectionViewCell.self,forCellWithReuseIdentifier: SingleTextCollectionViewCell.description())
        collectionView.register(SingleMediaCollectionViewCell.self, forCellWithReuseIdentifier: SingleMediaCollectionViewCell.description())
        
        return collectionView
    }()
    
    private lazy var quizProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .zmGreen
        progressView.trackTintColor = .zmGrayProgress
        progressView.layer.cornerRadius = 8
        progressView.clipsToBounds = true
        progressView.subviews[1].clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 8
        
        return progressView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(updateProgressView), for: .touchUpInside)
        button.backgroundColor = .zmPrimaryBlue
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupColors()
        setupNavigationController()
    }
    
    private func setupColors() {
        view.backgroundColor = .zmPurple
        quizCollectionView.backgroundColor = .zmPurple
    }
    
    private func setupSubviews() {
        [quizProgressView,quizCollectionView, button].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        quizProgressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(16)
        }
        quizCollectionView.snp.makeConstraints { make in
            make.top.equalTo(quizProgressView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(520)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(quizCollectionView.snp.bottom).offset(40)
            make.height.equalTo(52)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.title = "Stocks"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popVC))
    }
    
    @objc func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func updateProgressView() {
        if quizProgressView.progress != 1.0 {
            quizProgressView.progress += 0.1 / 1.0
        }
    }

}
