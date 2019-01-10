//
//  SwipingController+extension.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

extension OnBoardingViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in }
    }
}
