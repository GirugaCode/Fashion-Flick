//
//  ViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questionImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "QuestionImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
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
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-ExtraLight", size: 21)
        button.setTitleColor(#colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1), for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-ExtraLight", size: 21)
        button.setTitleColor(#colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1), for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControls()
    
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlStackView = UIStackView(arrangedSubviews: [skipButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
    }
    
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(questionImageView)
        
        
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.47),
            
            
            questionImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            questionImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            questionImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.9),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
            
            ])
    }
}

