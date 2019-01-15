//
//  HomeViewController.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/10/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "NightSky"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "--"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 120)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "--"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "--"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Monterrat-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dressMeUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dress Me Up!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 35)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.8352941176, blue: 0.7411764706, alpha: 1)
        button.addTarget(self, action: #selector(segueToStyleChoice), for: .touchUpInside)
        return button
    }()
    
    @objc private func segueToStyleChoice() {
        let styleViewController = StyleChoiceViewController()
        self.navigationController?.pushViewController(styleViewController, animated: true)
    }
    
    let forecastAPIKey = "8fe49fda16ece1e48e6b9bac680d358f"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        
        setupLayout()
        navigationUI()
        
        getUserCoordinates()
        self.lookUpCurrentLocation { (currentUserPlace) in
            guard let city = currentUserPlace?.locality else {return}
            self.cityLabel.text = city
        }
        
        // Checks if user already did on-boarding
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
        let infoContainerView = UIView()
        view.addSubview(topImageContainerView)
        view.addSubview(infoContainerView)
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(weatherImageView)
        view.addSubview(dressMeUpButton)
        view.addSubview(temperatureLabel)
        view.addSubview(summaryLabel)
        view.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            infoContainerView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 50),
            infoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            weatherImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 90),
            weatherImageView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor),
            weatherImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.65),
            
            cityLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor),
            cityLabel.heightAnchor.constraint(equalTo: infoContainerView.heightAnchor, multiplier: 0.2),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            temperatureLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor),
            
            summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            summaryLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor),
            summaryLabel.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor),
            
            dressMeUpButton.topAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: 100),
            dressMeUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dressMeUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            dressMeUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
            ])
        
    }
    
    fileprivate func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)-> Void ) {
        
        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }else {
                    completionHandler(nil)
                }
            })
        }
        else {
            completionHandler(nil)
        }
    }
    
    //This function requests permission to get user's location
    fileprivate func getUserCoordinates(){
        
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    //This Function gets the current user location from the device and makes the call to the api
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        let forecastService = ForecastService(locValue.latitude, locValue.longitude)
        forecastService.getForecast { (currentWeather) in
            DispatchQueue.main.async {
                // UPDATING Temperature's and Summary's Labels
                guard let weatherSummary = currentWeather.summary, let weatherTemperature = currentWeather.temperature else{return}
                self.summaryLabel.text = weatherSummary
                self.temperatureLabel.text = weatherTemperature.convertToInt().convertToString() + "°"
            }
        }
    }
    
}
