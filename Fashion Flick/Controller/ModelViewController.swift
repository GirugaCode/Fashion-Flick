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
    
    
    let hat: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "MaleImage")
        return imageView
    }()

    
    var male: String = ""
    var female: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        
        print(male)
        print(female)
        
        jsonParse()
        
        view.addSubview(hat)
        
        // Example of contraints with extensions
        hat.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        
//        hat.centerOfView(to: view)


    }

    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Checkout This Outfit!"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Thin", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // function to parse the JSON file
    func jsonParse() {
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
        
        // Conditional for headwear to put an image in
        if headWear == "Bandana" {
            hat.image = UIImage(imageLiteralResourceName: "NightSky")
        }
        
        print(headWear)
        print("worked!")
        
    }

}
