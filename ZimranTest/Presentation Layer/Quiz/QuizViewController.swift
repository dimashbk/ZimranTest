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
        collectionView.backgroundColor = .zmPrimaryBlue
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        
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
        button.setTitle("hui", for: .normal)
        button.addTarget(self, action: #selector(updateProgressView), for: .touchUpInside)
        button.backgroundColor = .red
        
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
    }
    private func setupSubviews() {
        [quizProgressView,button].forEach {
            view.addSubview($0)
        }
    }
    private func setupConstraints() {
        quizProgressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(16)
        }
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(718)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.title = "Stocks"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popVC))
    }
    private func configureCollectionView() {
        quizCollectionView.delegate = self
        quizCollectionView.dataSource = self
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
