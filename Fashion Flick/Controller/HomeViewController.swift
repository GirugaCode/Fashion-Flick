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
    
    private let dressMeUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dress Me Up!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        setupLayout()
        navigationUI()
        
        
        
        UserDefaults.standard.set(true, forKey: "current_user")

    }
    
    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Fashion Flick"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Thin", size: 35)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(weatherImageView)
        view.addSubview(dressMeUpButton)
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            weatherImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            weatherImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7),
            
            
            dressMeUpButton.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 170),
            dressMeUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dressMeUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            dressMeUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
            ])
        
    }
    
}
