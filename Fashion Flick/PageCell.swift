//
//  PageCell.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            guard let unwrappedPage = page else { return }
            questionImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 35)!, NSAttributedString.Key.foregroundColor: UIColor.white])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Light", size: 20)!, NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1)]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center

        }
    }
    
    private let questionImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "QuestionImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "What is this?", attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n\nNot sure what to wear today? Let us help you out! Fashion Flick is here to help you decide and inspire what to wear for the day so you do not have to struggle thinking of an outfit.", attributes: [NSAttributedString.Key.font: UIFont(name: "Montserrat-Light", size: 21)!, NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1)]))
        
        textView.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(questionImageView)
        addSubview(descriptionTextView)
        
        
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.47),
            
            
            questionImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            questionImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            questionImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.9),
            
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
