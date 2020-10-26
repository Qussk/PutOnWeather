//
//  SceneDelegate.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    window?.backgroundColor = .systemBackground
    let rootViewController = WeatherViewController()
    rootViewController.forecastService = ForecastServiceStub()
    //*의존성 주입, 유니테스트
    //외부에서 들어오는 값이 바뀜에 따라, 코드를 그대로니만 내용이 달라지게 하는 것.
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
  }
}
