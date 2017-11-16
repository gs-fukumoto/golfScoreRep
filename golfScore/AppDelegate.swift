//
//  AppDelegate.swift
//  golfScore
//
//  Created by gs_fukumoto on 2017/10/31.
//  Copyright © 2017年 gs_fukumoto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // global変数を登録する
    var compeId: String = ""
    var memId: String = ""
    var holeId: String = "0"
    var total: String = "0"
    var putts: String = "0"
    
    // コンペ登録画面に使用する変数
    var regCompeName: String = ""
    var regCompeCourse: String = ""
    var regMem1Grp: String = ""
    var regMem1Name: String = ""
    var regMem2Grp: String = ""
    var regMem2Name: String = ""
    var regMem3Grp: String = ""
    var regMem3Name: String = ""
    var regMem4Grp: String = ""
    var regMem4Name: String = ""


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

