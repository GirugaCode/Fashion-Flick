//
//  AppDelegate.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import IntentsUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?
    
    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        checkFirstTimeUser()
        
        // TODO: Implement notifications for users to open the app and start dressing

        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
        ) -> Bool {
        let styleViewController = StyleChoiceViewController()
        navigation?.pushViewController(styleViewController, animated: false)
        return true
    }
    
    private func checkFirstTimeUser() {
        let isCurrentUser = UserDefaults.standard.bool(forKey: "current_user")
        
        if isCurrentUser {
            showHome()
            
        } else {
            UserDefaults.standard.set(false, forKey: "current_user")
            showOnBoarding()
        }
    }

    private func showOnBoarding () {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window{
            
            let destinationVC = OnBoardingViewController(collectionViewLayout: layout)
            window.rootViewController = destinationVC
            window.makeKeyAndVisible()
        }
        
    }
    
    func showHome () {
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = HomeViewController()
        navigation = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigation
    }


}

