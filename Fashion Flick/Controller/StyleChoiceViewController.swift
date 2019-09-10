//
//  StyleChoiceViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/10/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import IntentsUI
import UIKit

class StyleChoiceViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addSiriShortcutButton, professionalButton, casualButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let clothingChoiceImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ClothingChoice"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addSiriShortcutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Siri Shortcut", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(addGetDressedShortcut), for: .touchUpInside)
        return button
    }()
    
    private let professionalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Professional", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 23)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        button.addTarget(self, action: #selector(pushToProfessionalChoice), for: .touchUpInside)
        return button
    }()
    
    private let casualButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Casual", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 23)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        button.addTarget(self, action: #selector(pushToCasualChoice), for: .touchUpInside)
        return button
    } ()
    
    @objc private func pushToProfessionalChoice(sender: UIButton) {
        let modelViewController = ModelChoiceViewController()
        modelViewController.style = "Professional"
        self.navigationController?.pushViewController(modelViewController, animated: true)
    }
    
    @objc private func pushToCasualChoice(sender: UIButton) {
        let modelViewController = ModelChoiceViewController()
        modelViewController.style = "Casual"
        self.navigationController?.pushViewController(modelViewController, animated: true)
    }
    
    @objc private func addGetDressedShortcut(sender: UIButton) {
        let activity = SiriShortuts.newOutfitShortcut(thumbnail: #imageLiteral(resourceName: "Fashion Flick Logo"))
        let shortcut = INShortcut(userActivity: activity)
        
        let IntentVC = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        IntentVC.delegate = self
        
        present(IntentVC, animated: true, completion: nil)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        setupLayout()
    }
    
    private func navigationUI() {
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.6, blue: 0.5764705882, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9921568627, green: 0.9843137255, blue: 0.7764705882, alpha: 1)
        navigationItem.title = "Select Style Choice"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Light", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(clothingChoiceImage)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            clothingChoiceImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            clothingChoiceImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            clothingChoiceImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7),
            
            stackView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
            ])
    }
}

extension StyleChoiceViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        dismiss(animated: true, completion: nil)

    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}



