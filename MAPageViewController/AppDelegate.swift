//
//  AppDelegate.swift
//  MAPageViewController
//
//  Created by Mike on 6/19/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var navigationController: UINavigationController?
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        let redVC: UIViewController = UIViewController()
        redVC.view.backgroundColor = UIColor.redColor()
        
        let blueVC: UIViewController = UIViewController()
        blueVC.view.backgroundColor = UIColor.blueColor()
        
        let greenVC: UIViewController = UIViewController()
        greenVC.view.backgroundColor = UIColor.greenColor()
        
        let orangeVC: UIViewController = UIViewController()
        orangeVC.view.backgroundColor = UIColor.orangeColor()
        
        let brownVC: UIViewController = UIViewController()
        brownVC.view.backgroundColor = UIColor.brownColor()
        
        let yellowVC: UIViewController = UIViewController()
        yellowVC.view.backgroundColor = UIColor.yellowColor()
        
        let viewControllers: UIViewController[] = [redVC, blueVC, greenVC, orangeVC, brownVC, yellowVC]
        let pageViewController: MAPageViewController = MAPageViewController(viewControllers: viewControllers)
        pageViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Objective-C", style: .Plain, target: self, action: "showObjectiveC")
        navigationController = UINavigationController(rootViewController: pageViewController)
        self.window!.rootViewController = navigationController
        
        return true
    }
    
    func showObjectiveC() {
        navigationController!.presentViewController(TestObjectiveCNavigationController(), animated: true, completion: nil)
    }
}


