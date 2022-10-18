//
//  SceneDelegate.swift
//  AppEventCount
//
//  Created by Michael Whiting on 10/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewController: ViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        viewController = window?.rootViewController as? ViewController
        viewController?.willConnectToCount += 1
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        viewController?.updateView()
        viewController?.didBecomeActiveCount += 1
    }

    func sceneWillResignActive(_ scene: UIScene) {
        viewController?.willResignActiveCount += 1
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        viewController?.willEnterForeroundCount += 1
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        viewController?.didEnterBackgroundCount += 1
    }


}

