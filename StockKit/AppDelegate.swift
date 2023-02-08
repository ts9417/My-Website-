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
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made 