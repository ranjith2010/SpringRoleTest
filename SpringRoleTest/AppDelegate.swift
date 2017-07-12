//
//  AppDelegate.swift
//  SpringRoleTest
//
//  Created by Ranjith Kumar on 7/12/17.
//  Copyright © 2017 Ranjith Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.rootSceneSetup()
        return true
    }
    
    //MARK: - Private functions
    private func rootSceneSetup() {
        self.window = UIWindow()
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        let nc = UINavigationController.init(rootViewController: SRCategoriesListController())
        self.window?.rootViewController = nc
    }
    
}

