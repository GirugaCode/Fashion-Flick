//
//  ModelViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/11/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {

    
    var male: String = ""
    var female: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        print(male)
        print(female)

        // Do any additional setup after loading the view.
    }

    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        navigationItem.title = "Checkout This Outfit!"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Thin", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
