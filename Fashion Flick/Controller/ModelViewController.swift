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
    
    private lazy var clothingStackView: UIStackView = {
        let clothingStackView = UIStackView(arrangedSubviews: [headWearTextView, bodyWearTextView, bottomWearTextView, footWearTextView])
        clothingStackView.alignment = .fill
        clothingStackView.distribution = .fillEqually
        clothingStackView.axis = .vertical
        clothingStackView.spacing = 50
        clothingStackView.translatesAutoresizingMaskIntoConstraints = false
        return clothingStackView
    }()
    
    private let headWearTextView: UIView = {
        let textView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6784313725, blue: 0.6509803922, alpha: 1)
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let bodyWearTextView: UIView = {
        let textView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6784313725, blue: 0.6509803922, alpha: 1)
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let bottomWearTextView: UIView = {
        let textView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6784313725, blue: 0.6509803922, alpha: 1)
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let footWearTextView: UIView = {
        let textView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6784313725, blue: 0.6509803922, alpha: 1)
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let headWearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Hat"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bodyWearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Shirt"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomWearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Pants"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let footWearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Crocs"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        modelImageContainerView.addSubview(clothingStackView)
        modelImageContainerView.addSubview(headWearLabel)
        modelImageContainerView.addSubview(bodyWearLabel)
        modelImageContainerView.addSubview(bottomWearLabel)
        modelImageContainerView.addSubview(footWearLabel)
        
        NSLayoutConstraint.activate([
            modelImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            modelImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modelImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modelImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            femaleModel.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor),
            femaleModel.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor),
            femaleModel.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -150),
            femaleModel.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 1),
            
            clothingStackView.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor, constant: 20),
            clothingStackView.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor, constant: 210),
            clothingStackView.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -5),
            clothingStackView.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 0.9),
            
            headWearLabel.centerXAnchor.constraint(equalTo: headWearTextView.centerXAnchor),
            headWearLabel.centerYAnchor.constraint(equalTo: headWearTextView.centerYAnchor),
            headWearLabel.heightAnchor.constraint(equalTo: headWearTextView.heightAnchor, multiplier: 0.5),
            
            bodyWearLabel.centerXAnchor.constraint(equalTo: bodyWearTextView.centerXAnchor),
            bodyWearLabel.centerYAnchor.constraint(equalTo: bodyWearTextView.centerYAnchor),
            bodyWearLabel.heightAnchor.constraint(equalTo: bodyWearTextView.heightAnchor, multiplier: 0.5),
            
            bottomWearLabel.centerXAnchor.constraint(equalTo: bottomWearTextView.centerXAnchor),
            bottomWearLabel.centerYAnchor.constraint(equalTo: bottomWearTextView.centerYAnchor),
            bottomWearLabel.heightAnchor.constraint(equalTo: bottomWearTextView.heightAnchor, multiplier: 0.5),
            
            footWearLabel.centerXAnchor.constraint(equalTo: footWearTextView.centerXAnchor),
            footWearLabel.centerYAnchor.constraint(equalTo: footWearTextView.centerYAnchor),
            footWearLabel.heightAnchor.constraint(equalTo: footWearTextView.heightAnchor, multiplier: 0.5)

            ])
    }
    
    private func setupMaleLayout(){
        let modelImageContainerView = UIView()
        view.addSubview(modelImageContainerView)
        modelImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        modelImageContainerView.addSubview(maleModel)
        modelImageContainerView.addSubview(clothingStackView)
        modelImageContainerView.addSubview(headWearLabel)
        modelImageContainerView.addSubview(bodyWearLabel)
        modelImageContainerView.addSubview(bottomWearLabel)
        modelImageContainerView.addSubview(footWearLabel)
        
        NSLayoutConstraint.activate([
            modelImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            modelImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modelImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modelImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            maleModel.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor),
            maleModel.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor),
            maleModel.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -150),
            maleModel.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 1),
            
            clothingStackView.topAnchor.constraint(equalTo: modelImageContainerView.topAnchor, constant: 10),
            clothingStackView.leadingAnchor.constraint(equalTo: modelImageContainerView.leadingAnchor, constant: 210),
            clothingStackView.trailingAnchor.constraint(equalTo: modelImageContainerView.trailingAnchor, constant: -5),
            clothingStackView.heightAnchor.constraint(equalTo: modelImageContainerView.heightAnchor, multiplier: 0.9),
            
            headWearLabel.centerXAnchor.constraint(equalTo: headWearTextView.centerXAnchor),
            headWearLabel.centerYAnchor.constraint(equalTo: headWearTextView.centerYAnchor),
            headWearLabel.heightAnchor.constraint(equalTo: headWearTextView.heightAnchor, multiplier: 0.5),
            
            bodyWearLabel.centerXAnchor.constraint(equalTo: bodyWearTextView.centerXAnchor),
            bodyWearLabel.centerYAnchor.constraint(equalTo: bodyWearTextView.centerYAnchor),
            bodyWearLabel.heightAnchor.constraint(equalTo: bodyWearTextView.heightAnchor, multiplier: 0.5),
            
            bottomWearLabel.centerXAnchor.constraint(equalTo: bottomWearTextView.centerXAnchor),
            bottomWearLabel.centerYAnchor.constraint(equalTo: bottomWearTextView.centerYAnchor),
            bottomWearLabel.heightAnchor.constraint(equalTo: bottomWearTextView.heightAnchor, multiplier: 0.5),
            
            footWearLabel.centerXAnchor.constraint(equalTo: footWearTextView.centerXAnchor),
            footWearLabel.centerYAnchor.constraint(equalTo: footWearTextView.centerYAnchor),
            footWearLabel.heightAnchor.constraint(equalTo: footWearTextView.heightAnchor, multiplier: 0.5)
            
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
