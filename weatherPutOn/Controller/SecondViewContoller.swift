//
//  SecondViewContoller.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/24.
//

import UIKit

class SecondeViewContoller : UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .clear
    view.alpha = 0.5
   // navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    swipeRecognizer()
  }
  
  func swipeRecognizer() {
          let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
          swipeRight.direction = UISwipeGestureRecognizer.Direction.left
          self.view.addGestureRecognizer(swipeRight)
          
      }
      @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
          if let swipeGesture = gesture as? UISwipeGestureRecognizer {
              switch swipeGesture.direction{
              case UISwipeGestureRecognizer.Direction.left:
            dismiss(animated: true, completion: nil)
              default: break
              }
          }
      }
  
}
