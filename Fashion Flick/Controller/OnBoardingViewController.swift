//
//  OnBoardingViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class OnBoardingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "QuestionImage", headerText: "What is this?", bodyText: "Not sure what to wear today? Let us help you out! Fashion Flick is here to help you decide and inspire what to wear for the day so you do not have to struggle thinking of an outfit."),
        Page(imageName: "HowToUseImage", headerText: "How to Use", bodyText: "We’ll first give you the Date and Weather and you can plan out the style or occasion you are going for. Then you can select the type of style that fits you for the day. From there you can choose your choice of Male or Female, then we generate a suggested outfit for you!"),
        Page(imageName: "DressUpImage", headerText: "Time to Dress Up!", bodyText: "FANTASTIC! You now have an outfit to work with! From here you can either draw inspiration from the fit or you can generate a new one to keep yourself inspired! Now go out and feel confident!")
    ]
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-ExtraLight", size: 21)
        button.setTitleColor(#colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-ExtraLight", size: 21)
        button.setTitleColor(#colorLiteral(red: 0.2117647059, green: 0.1529411765, blue: 0.1725490196, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()

    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
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
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        doneWithOnboarding()
    }
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleDone(_ sender: UIButton) {
        AppDelegate.shared.showHome()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageIndicator = targetContentOffset.pointee.x
        pageControl.currentPage = Int(pageIndicator / view.frame.width)
        doneWithOnboarding()
    }
    
    func doneWithOnboarding () {
        if pageControl.currentPage == 2 {
            nextButton.setTitle("Done", for: .normal)
            nextButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
        
}
