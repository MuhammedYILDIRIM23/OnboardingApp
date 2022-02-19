//
//  ViewController.swift
//  OnboardingApp
//
//  Created by Muhammed YILDIRIM  on 16.02.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var onboardingData: [OnboardingModel] = []
    var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardingData.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
            } else {
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewsetup()
        configureButton()
        createData()
        numberOfPages()
        
    }

    private func numberOfPages() {
        pageControl.numberOfPages = onboardingData.count
    }
    
    private func createData() {
        onboardingData = [
            OnboardingModel(title: "Sell", detail: "Sell your product with your require money. And easy to post.", image: #imageLiteral(resourceName: "one")),
            OnboardingModel(title: "Buy", detail: "Bye any product in your like. Get it easily and high quality product.", image: #imageLiteral(resourceName: "two")),
            OnboardingModel(title: "Get Reward", detail: "We giving regularly reward to our lucky clients.", image: #imageLiteral(resourceName: "three"))]
    }
    
    func configureButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 20
        nextButton.backgroundColor = .orange
        nextButton.tintColor = .white
  
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if currentPage == onboardingData.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

    }
    @IBAction func skipClicked(_ sender: Any) {
        currentPage = onboardingData.count - 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.cellIdentifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(onboardingData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
        
    }
}

