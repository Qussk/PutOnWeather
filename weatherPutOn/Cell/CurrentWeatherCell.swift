//
//  CurrentWeatherCell.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/05.
//

import UIKit

final class CurrentWeatherCell: UITableViewCell {
  
  static let identifier = "CurrentWeatherCell"
  
  private enum Layout {
    static let xPadding: CGFloat = 8
    static let yPadding: CGFloat = 6
    
    static let weatherImageSize: CGFloat = 40
  }

  // MARK: Subviews
  
  private let weatherImageView = UIImageView().then {
    let size = Layout.weatherImageSize
    $0.frame = .init(16, 16, size, size)
    $0.contentMode = .scaleAspectFit
  }
  private let statusLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 21, weight: .semibold)
  }
  private let tempMinMaxLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 20, weight: .bold)
  }
  private let currentTempLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 110, weight: .light)
  }
  
  // MARK: Life Cycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    separatorInset.left = .screenWidth
    contentView.addSubviews(
      weatherImageView, statusLabel, tempMinMaxLabel, currentTempLabel
    )
    configureLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func configureLayout() {
    //font에 따라 높이가 다르기 때문에 레이블의 높이 다르게
    statusLabel.width = .screenWidth
    statusLabel.height = "1".size(with: statusLabel.font!).height
    statusLabel.x = weatherImageView.maxX + 0
    statusLabel.center.y = weatherImageView.center.y
    
    tempMinMaxLabel.width = .screenWidth
    tempMinMaxLabel.height = "1".size(with: tempMinMaxLabel.font!).height
    tempMinMaxLabel.x = weatherImageView.x + Layout.xPadding
    tempMinMaxLabel.y = weatherImageView.maxY + Layout.yPadding
    
    currentTempLabel.width = .screenWidth
    currentTempLabel.height = "1".size(with: currentTempLabel.font!).height
    currentTempLabel.x = tempMinMaxLabel.x
    currentTempLabel.y = tempMinMaxLabel.maxY - Layout.yPadding
  }
  
  // MARK: Configure Cell
  
  func configure(
    weatherImageName: String,
    weatherStatus: String,
    minTemp: String,
    maxTemp: String,
    currentTemp: String
  ) {
    weatherImageView.image = UIImage(named: weatherImageName)
    statusLabel.text = weatherStatus
    
    // e.g. ⤓10.2°  ⤒19.4°
    let kernAttr: [NSAttributedString.Key: Any] = [.kern: -1]
    let fontAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .light)]
    let mergedAttrs = kernAttr.merging(fontAttr) { _, _ in } //merging: 딕셔너리를 합치는 것.kern과font를 합치는 것
    print("mergedAttrs :", mergedAttrs)
    //하나의 레이블에서 서로 다른 폰트 적용
    let mutableString = NSMutableAttributedString(string: "⤓", attributes: mergedAttrs)
    mutableString.append(NSAttributedString(string: minTemp, attributes: kernAttr))
    mutableString.append(NSAttributedString(string: "   "))
    mutableString.append(NSAttributedString(string: "⤒", attributes: mergedAttrs))
    mutableString.append(NSAttributedString(string: maxTemp, attributes: kernAttr))
    tempMinMaxLabel.attributedText = mutableString
    
    currentTempLabel.attributedText = NSAttributedString(
      string: currentTemp, attributes: [.kern: -10] //자간
    )
  }
}

