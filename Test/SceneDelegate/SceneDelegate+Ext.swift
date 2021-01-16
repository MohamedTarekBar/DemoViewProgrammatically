//
//  SceneDelegate+Ext.swift
//  Test
//
//  Created by MohamedTarek on 22/12/2020.
//

import UIKit
import IQKeyboardManagerSwift

extension SceneDelegate {
    
    func setupRootViewController(isLoggedInRoot: UIViewController ,new:UIViewController) {
        if UserDefaultManager.isLoggedIn {
            let root = UINavigationController(rootViewController: isLoggedInRoot)
            window?.rootViewController = root
            window?.makeKeyAndVisible()
        } else {
            let root = UINavigationController(rootViewController: new)
            window?.rootViewController = root
            window?.makeKeyAndVisible()
        }
    }
    
    func setupApp(scene: UIWindowScene) {
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
    }
    
    func setupIQKeyBoard() {
        IQKeyboardManager.shared.enable = true
    }
}
