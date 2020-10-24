//
//  WeatherView.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import UIKit

class WeatherView : UIView {
  
  private let backgroundImageView: UIImageView = {
    let imageView = UIImageView(frame: .screenBounds)
    imageView.image = UIImage(named: "sunny")
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  // MARK: Life Cycle
  
  init() {
    super.init(frame: .screenBounds)
    self.addSubview(backgroundImageView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

  

