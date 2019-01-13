//
//  ModelChoiceViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/10/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ModelChoiceViewController: UIViewController {
    
    var style: String = ""
    
    let maleModelChoice: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "MaleImage"), for: .normal)
        button.addTarget(self, action: #selector(moveToMaleModel), for: .touchUpInside)
        return button
    } ()
    
    let femaleModelChoice: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "FemalImage"), for: .normal)
        button.addTarget(self, action: #selector(moveToFemaleModel), for: .touchUpInside)
        return button
    } ()
    
    @objc func moveToMaleModel() {
        let modelViewController = ModelViewController()
        modelViewController.male = "Male"
        self.navigationController?.pushViewController(modelViewController, animated: true)
    }
    
    @objc func moveToFemaleModel() {
        let modelViewController = ModelViewController()
        modelViewController.female = "Female"
        self.navigationController?.pushViewController(modelViewController, animated: true)
    }


    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        setupLayout()
        print(style)
        

        // Do any additional setup after loading the view.
    }
    
    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Select Model Choice"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Thin", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(maleModelChoice)
        
        let bottomImageContainerView = UIView()
        view.addSubview(bottomImageContainerView)
        bottomImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageContainerView.addSubview(femaleModelChoice)
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            bottomImageContainerView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 20),
            bottomImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            maleModelChoice.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            maleModelChoice.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            maleModelChoice.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.8),
            
            femaleModelChoice.centerXAnchor.constraint(equalTo: bottomImageContainerView.centerXAnchor),
            femaleModelChoice.centerYAnchor.constraint(equalTo: bottomImageContainerView.centerYAnchor),
            femaleModelChoice.heightAnchor.constraint(equalTo: bottomImageContainerView.heightAnchor, multiplier: 0.8)
            
            ])
    }
    

}
