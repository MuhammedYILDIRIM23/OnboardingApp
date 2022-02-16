//
//  OnboardingCollectionViewCell.swift
//  OnboardingApp
//
//  Created by Muhammed YILDIRIM  on 16.02.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func setupCell(_ model: OnboardingModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
    
    
    
}
