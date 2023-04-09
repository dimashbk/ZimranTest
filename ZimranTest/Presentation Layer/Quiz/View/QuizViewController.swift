//
//  QuizViewController.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 06.04.2023.
//

import UIKit


protocol QuizCollectionViewCellDelegate: AnyObject {
    func scroll(_ cell: UICollectionViewCell)
}

final class QuizViewController: UIViewController {

    var quizViewModel: QuizViewModel?
    var cellIndex = 0
    
    // MARK: - UI Elements
    
    lazy var quizCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .zmPrimaryBlue
        collectionView.layer.cornerRadius = 8
        collectionView.register(SingleTextCollectionViewCell.self,
                                forCellWithReuseIdentifier: SingleTextCollectionViewCell.description())
        collectionView.register(SingleMediaCollectionViewCell.self,
                                forCellWithReuseIdentifier: SingleMediaCollectionViewCell.description())
        collectionView.register(BooleanCollectionViewCell.self,
                                forCellWithReuseIdentifier: BooleanCollectionViewCell.description())
        collectionView.register(MatchingCollectionViewCell.self,
                                forCellWithReuseIdentifier: MatchingCollectionViewCell.description())
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Check", for: .normal)
        button.addTarget(self, action: #selector(nextButoon), for: .touchUpInside)
        button.backgroundColor = .zmPrimaryBlue
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    lazy var trueButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("True", for: .normal)
        button.backgroundColor = .zmGreen
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nextButoon), for: .touchUpInside)
        
        return button
    }()
    
    lazy var falseButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("False", for: .normal)
        button.backgroundColor = .zmRed
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nextButoon), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var resultView: ResultView = {
        let view = ResultView()
        view.continueButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
        view.isHidden = true
        
        return view
    }()
    private func bindQuizVM() {
        quizViewModel?.updateViewData = {
            DispatchQueue.main.async {
                self.quizCollectionView.reloadData()
            }
        }
    }
    // MARK: - Lyfecicle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        quizViewModel?.fetchLesson()
        navigationController?.navigationBar.barTintColor = .zmPrimaryBlue
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.topItem?.title = "Stocks"
    }
    
    // MARK: - Private funcs
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupColors()
        setupNavigationController()
        bindQuizVM()
    }
    
    private func setupColors() {
        view.backgroundColor = .zmPurple
        quizCollectionView.backgroundColor = .zmPurple
    }
    
    private func setupSubviews() {
        [quizProgressView,quizCollectionView, button, trueButton, falseButton, resultView].forEach {
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
        falseButton.snp.makeConstraints { make in
            make.top.equalTo(quizCollectionView.snp.bottom).offset(40)
            make.height.equalTo(52)
            make.width.equalTo(view.bounds.width / 2 - 21)
            make.left.equalToSuperview().inset(16)
        }
        trueButton.snp.makeConstraints { make in
            make.top.equalTo(quizCollectionView.snp.bottom).offset(40)
            make.height.equalTo(52)
            make.width.equalTo(view.bounds.width / 2 - 21)
            make.right.equalToSuperview().inset(16)
        }
        resultView.snp.makeConstraints { make in
            make.height.equalTo(view.bounds.width / 2
                                + 10)
            make.width.equalTo(view.bounds.width)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupNavigationController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popVC))
    }
    
    private func updateProgressView() {
        if quizProgressView.progress != 1.0 {
            quizProgressView.progress += 0.1 / 1.0
        }
    }
    
    // MARK: - @objc funcs
    
    @objc func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButoon() {
            resultView.isHidden = false
    }
    
    @objc func nextQuestion() {
        updateProgressView()
        if quizProgressView.progress == 1.0 {
            navigationController?.pushViewController(ResultViewController(), animated: true)
        }
        if cellIndex < (quizViewModel!.lesson[0].questions.count - 1) && quizViewModel!.lesson[0].questions[cellIndex + 1].type == "BOOLEAN" {
            quizCollectionView.scrollToItem(at: IndexPath(row: cellIndex+1, section: 0), at: .right, animated: true)
            button.isHidden = true
            trueButton.isHidden = false
            falseButton.isHidden = false
            cellIndex += 1
        } else if cellIndex < (quizViewModel!.lesson[0].questions.count - 1) {
            quizCollectionView.scrollToItem(at: IndexPath(row: cellIndex+1, section: 0), at: .right, animated: true)
            button.isHidden = false
            trueButton.isHidden = true
            falseButton.isHidden = true
            cellIndex += 1
        }
        resultView.isHidden = true
    }
}

