//
//  HomeViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/10/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "NightSky"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        setupLayout()
        
        view.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        
        UserDefaults.standard.set(true, forKey: "current_user")

    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(weatherImageView)
        
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            weatherImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            weatherImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7)
            
            ])
        
    }
    
}
