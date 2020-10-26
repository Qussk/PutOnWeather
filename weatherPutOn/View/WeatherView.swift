//
//  WeatherView.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import UIKit

final class WeatherView: UIView {
  
  private enum Layout {
    static let xMargin: CGFloat = 20
    static let topInfoViewHeight: CGFloat = 45
    static let locationLabelHeight: CGFloat = 23
    static let reloadbuttonSize: CGFloat = 40
  }
  
  // MARK: Subviews
  
  private let backgroundImageView = UIImageView(frame: .screenBounds).then {
    $0.image = UIImage(named: "sunny")
    $0.contentMode = .scaleAspectFill
  }
  private let topInfoView = UIView()
  private let locationLabel = UILabel().then {
    $0.textColor = .white
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 18, weight: .black)
  }
  private let timeLabel = UILabel().then {
    $0.textColor = .white
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 12, weight: .black)
  }
  
  let reloadButton = UIButton(type: .system).then {
    $0.setTitle("↻", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .preferredFont(forTextStyle: .title1)
    $0.alpha = 0
  }
  
  // MARK: Life Cycle
  
  init() {
    super.init(frame: .screenBounds)
    self.addSubviews(backgroundImageView, topInfoView)
    topInfoView.addSubviews(locationLabel, timeLabel, reloadButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    topInfoView.frame = .init(
      Layout.xMargin, 0,
      width - (Layout.xMargin * 2), safeAreaInsets.top + Layout.topInfoViewHeight
    )
    locationLabel.frame = .init(
      0, safeAreaInsets.top,
      topInfoView.width, Layout.locationLabelHeight
    )
    timeLabel.frame = .init(
      0, locationLabel.maxY - 2,
      topInfoView.width, Layout.topInfoViewHeight - Layout.locationLabelHeight
    )
    reloadButton.frame = .init(
      topInfoView.width - Layout.reloadbuttonSize, 0,
      Layout.reloadbuttonSize, Layout.reloadbuttonSize
    )
    reloadButton.center.y = (Layout.topInfoViewHeight / 2) + safeAreaInsets.top
  }
}


// MARK: - Manipulate View

extension WeatherView {
  func updateTopInfoView(location: String, time: String) {
    locationLabel.text = location
    timeLabel.text = time
    
    locationLabel.alpha = 0
    timeLabel.alpha = 0
    reloadButton.alpha = 0
    
    UIView.animate(withDuration: 0.4) {
      self.locationLabel.alpha = 1
      self.timeLabel.alpha = 1
      self.reloadButton.alpha = 1
    }
  }
}





