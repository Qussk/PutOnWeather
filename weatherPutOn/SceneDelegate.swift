//
//  SceneDelegate.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    window?.backgroundColor = .systemBackground
    let rootViewController = WeatherViewController()
   // rootViewController.forecastService = ForecastService()
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }
}
