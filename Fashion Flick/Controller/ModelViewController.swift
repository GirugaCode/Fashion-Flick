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
    
    var male: String = ""
    var female: String = ""
    var styleChoice: String = ""
    
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
    
    private let generateNewOutfit: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate New Outfit", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 24)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6431372549, green: 0.5490196078, blue: 0.4352941176, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushToGenerateNewOutfit), for: .touchUpInside)
        return button
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
    
    @objc private func pushToGenerateNewOutfit(sender: UIButton) {
        jsonParse()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        jsonParse()
    
    }

    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Checkout This Outfit!"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Light", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
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
        view.addSubview(generateNewOutfit)
        
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
            footWearLabel.heightAnchor.constraint(equalTo: footWearTextView.heightAnchor, multiplier: 0.5),

            generateNewOutfit.topAnchor.constraint(equalTo: modelImageContainerView.bottomAnchor, constant: 100),
            generateNewOutfit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            generateNewOutfit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            generateNewOutfit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
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
        view.addSubview(generateNewOutfit)
        
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
            footWearLabel.heightAnchor.constraint(equalTo: footWearTextView.heightAnchor, multiplier: 0.5),
            
            generateNewOutfit.topAnchor.constraint(equalTo: modelImageContainerView.bottomAnchor, constant: 100),
            generateNewOutfit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            generateNewOutfit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            generateNewOutfit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
            
            ])
    }
    
    // function to get a random index of an array  
    private func randomArrayIndex(array: Array<Any>) -> Int {
        let randomIndex = Int.random(in: 0...array.count - 1)
        return randomIndex
    }
    
    // function to parse the JSON file
    private func jsonParse() {
        guard let jsonURL = Bundle.main.url(forResource: "Fashion-Flick-Database" , withExtension: "JSON") else {
            print("Could not find Fashion-Flick-Database.JSON")
            return
        }
        
        let jsonData = try! Data(contentsOf: jsonURL)
        
        let clothingData = try! JSON(data: jsonData)
        
        // Gets the array value of the Professional Male Outfit
        let pmHead = clothingData["professional"]["male"]["headwear"].arrayValue
        let pmBody = clothingData["professional"]["male"]["bodywear"].arrayValue
        let pmBottom = clothingData["professional"]["male"]["bottomwear"].arrayValue
        let pmFoot = clothingData["professional"]["male"]["footwear"].arrayValue
    
   
        // Gets a random piece of clothing and converts it into a string
        let pmHeadWear = clothingData["professional"]["male"]["headwear"][randomArrayIndex(array: pmHead)].stringValue
        let pmBodyWear = clothingData["professional"]["male"]["bodywear"][randomArrayIndex(array: pmBody)].stringValue
        let pmBottomWear = clothingData["professional"]["male"]["bottomwear"][randomArrayIndex(array: pmBottom)].stringValue
        let pmFootWear = clothingData["professional"]["male"]["footwear"][randomArrayIndex(array: pmFoot)].stringValue
        
        // Gets the array value of the Casual Male Outfit
        let cmHead = clothingData["casual"]["male"]["headwear"].arrayValue
        let cmBody = clothingData["casual"]["male"]["bodywear"].arrayValue
        let cmBottom = clothingData["casual"]["male"]["bottomwear"].arrayValue
        let cmFoot = clothingData["casual"]["male"]["footwear"].arrayValue
        
        let cmHeadWear = clothingData["casual"]["male"]["headwear"][randomArrayIndex(array: cmHead)].stringValue
        let cmBodyWear = clothingData["casual"]["male"]["bodywear"][randomArrayIndex(array: cmBody)].stringValue
        let cmBottomWear = clothingData["casual"]["male"]["bottomwear"][randomArrayIndex(array: cmBottom)].stringValue
        let cmFootWear = clothingData["casual"]["male"]["footwear"][randomArrayIndex(array: cmFoot)].stringValue
        
        
        // Gets the array value of the Professional Female Outfit
        let pfHead = clothingData["professional"]["female"]["headwear"].arrayValue
        let pfBody = clothingData["professional"]["female"]["bodywear"].arrayValue
        let pfBottom = clothingData["professional"]["female"]["bottomwear"].arrayValue
        let pfFoot = clothingData["professional"]["female"]["footwear"].arrayValue
        
        let pfHeadWear = clothingData["professional"]["female"]["headwear"][randomArrayIndex(array: pfHead)].stringValue
        let pfBodyWear = clothingData["professional"]["female"]["bodywear"][randomArrayIndex(array: pfBody)].stringValue
        let pfBottomWear = clothingData["professional"]["female"]["bottomwear"][randomArrayIndex(array: pfBottom)].stringValue
        let pfFootWear = clothingData["professional"]["female"]["footwear"][randomArrayIndex(array: pfFoot)].stringValue
        
        // Gets the array value of the Casual Female Outfit
        let cfHead = clothingData["casual"]["female"]["headwear"].arrayValue
        let cfBody = clothingData["casual"]["female"]["bodywear"].arrayValue
        let cfBottom = clothingData["casual"]["female"]["bottomwear"].arrayValue
        let cfFoot = clothingData["casual"]["female"]["footwear"].arrayValue
        
        let cfHeadWear = clothingData["casual"]["female"]["headwear"][randomArrayIndex(array: cfHead)].stringValue
        let cfBodyWear = clothingData["casual"]["female"]["bodywear"][randomArrayIndex(array: cfBody)].stringValue
        let cfBottomWear = clothingData["casual"]["female"]["bottomwear"][randomArrayIndex(array: cfBottom)].stringValue
        let cfFootWear = clothingData["casual"]["female"]["footwear"][randomArrayIndex(array: cfFoot)].stringValue
        
        
        
    
//        // Conditional for headwear to put an image in
//        if headWear == "Bandana" {
//            hat.image = UIImage(imageLiteralResourceName: "NightSky")
//        }
        
        
        
        
        
        if male == "Male" && styleChoice == "Professional" {
            setupMaleLayout()
            headWearLabel.text = pmHeadWear
            bodyWearLabel.text = pmBodyWear
            bottomWearLabel.text = pmBottomWear
            footWearLabel.text = pmFootWear
        }
        
        if male == "Male" && styleChoice == "Casual" {
            setupMaleLayout()
            headWearLabel.text = cmHeadWear
            bodyWearLabel.text = cmBodyWear
            bottomWearLabel.text = cmBottomWear
            footWearLabel.text = cmFootWear
        }
        
        if female == "Female" && styleChoice == "Professional" {
            setupFemaleLayout()
            headWearLabel.text = pfHeadWear
            bodyWearLabel.text = pfBodyWear
            bottomWearLabel.text = pfBottomWear
            footWearLabel.text = pfFootWear
        }
        
        if female == "Female" && styleChoice == "Casual" {
            setupFemaleLayout()
            headWearLabel.text = cfHeadWear
            bodyWearLabel.text = cfBodyWear
            bottomWearLabel.text = cfBottomWear
            footWearLabel.text = cfFootWear
        }
        
    }

}
