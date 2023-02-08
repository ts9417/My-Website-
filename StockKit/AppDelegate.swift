//
//  AppDelegate.swift
//  StockKit
//
//  Created by Nathan Tannar on 7/20/17.
//  Copyright © 2017 Nathan Tannar. All rights reserved.
//

import UIKit
import CoreData
import NTComponents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.shared.statusBarStyle = .lightContent
        Color.Default.setNoShadow()
        Color.Default.setPrimary(to: Color.Black.lighter(by: 5))
        Color.Default.Background.ViewController = Color.Black.lighter(by: 5)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NTNavigationController(rootViewController: StockTrackerViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
     