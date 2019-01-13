//
//  ModelViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/11/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit
import SwiftyJSON

class ModelViewController: UIViewController {
    
    private let maleModel: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MaleModel"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let femaleModel: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "FemaleModel"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var male: String = ""
    var female: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        
        if male == "Male" {
            setupMaleLayout()
        }
        
        if female == "Female" {
            setupFemaleLayout()
        }
        
        print(male)
        print(female)
        
        jsonParse()



    }

    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Checkout This Outfit!"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Thin", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupFemaleLayout(){
        let modelImageContainerView = UIView()
        view.addSubview(modelImageContainerView)
        modelImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        modelImageContainerView.addSubview(femaleModel)
        
        NSLayoutConstraint.activate([
            modelImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            modelImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modelImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modelImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            femaleModel.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor),
            femaleModel.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor, constant: 25),
            femaleModel.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -25),
            femaleModel.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 1)
            
            ])
    }
    
    private func setupMaleLayout(){
        let modelImageContainerView = UIView()
        view.addSubview(modelImageContainerView)
        modelImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        modelImageContainerView.addSubview(maleModel)
        
        NSLayoutConstraint.activate([
            modelImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            modelImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modelImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modelImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            maleModel.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor),
            maleModel.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor, constant: 25),
            maleModel.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -25),
            maleModel.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 1)
            
            ])
    }
    
    // function to parse the JSON file
    private func jsonParse() {
        guard let jsonURL = Bundle.main.url(forResource: "Fashion-Flick-Database" , withExtension: "JSON") else {
            print("Could not find Fashion-Flick-Database.JSON")
            return
        }
        
        let jsonData = try! Data(contentsOf: jsonURL)
        
        let clothingData = try! JSON(data: jsonData)
        
        // Gets the array value of the headwear
        let headWearCount = clothingData["professional"]["male"]["headwear"].arrayValue
        
        // Gets a random piece of head wear and converts it into a string
        let headWear = clothingData["professional"]["male"]["headwear"][Int.random(in: 0...headWearCount.count - 1)].stringValue
        
//        // Conditional for headwear to put an image in
//        if headWear == "Bandana" {
//            hat.image = UIImage(imageLiteralResourceName: "NightSky")
//        }
        
        print(headWear)
        print("worked!")
        
    }

}
