//
//  ViewController.swift
//  OnboardingApp
//
//  Created by Muhammed YILDIRIM  on 16.02.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            configureButton()
        }
    }
    @IBOutlet weak var skipButton: UIButton!
    
    var onboardingData: [OnboardingModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        collectionViewsetup()
    }

    
    
    private func createData() {
        onboardingData = [
            OnboardingModel(title: "Sell", detail: "Sell your product with your require money. And easy to post.", image: #imageLiteral(resourceName: "one")),
            OnboardingModel(title: "Buy", detail: "Bye any product in your like. Get it easily and high quality product.", image: #imageLiteral(resourceName: "two")),
            OnboardingModel(title: "Get Reward", detail: "We giving regularly reward to our lucky clients.", image: #imageLiteral(resourceName: "three"))]
    }
    
    func configureButton() {
        nextButton.layer.cornerRadius = 20
        nextButton.backgroundColor = .orange
        nextButton.tintColor = .white
        nextButton.layer.shadowOpacity = 0.25
        nextButton.layer.shadowOffset = .zero
        nextButton.layer.shadowRadius = 2
    }
    
    @IBAction func nextClicked(_ sender: Any) {
    }
    @IBAction func skipClicked(_ sender: Any) {
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func collectionViewsetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(onboardingData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

