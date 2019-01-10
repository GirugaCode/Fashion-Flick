//
//  SwipingController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "QuestionImage", headerText: "What is this?", bodyText: "Not sure what to wear today? Let us help you out! Fashion Flick is here to help you decide and inspire what to wear for the day so you do not have to struggle thinking of an outfit."),
        Page(imageName: "HowToUseImage", headerText: "How to Use", bodyText: "We’ll first give you the Date and Weather and you can plan out the style or occasion you are going for. Then you can select the type of style that fits you for the day. From there you can choose your choice of Male or Female, then we generate a suggested outfit for you!"),
        Page(imageName: "DressUpImage", headerText: "Time to Dress Up!", bodyText: "FANTASTIC! You now have an outfit to work with! From here you can either draw inspiration from the fit or you can generate a new one to keep yourself inspired! Now go out and feel confident!")
        
    ]
    
//    let imageNames = ["QuestionImage", "HowToUseImage", "DressUpImage"]
//    let headerStrings = ["What is this?", "How to Use", "Time to Dress Up!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
//        let imageName = imageNames[indexPath.item]
//        cell.questionImageView.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
