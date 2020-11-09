//
//  ForecastCell.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/05.
//

import UIKit

final class ForecastCell: UITableViewCell {
  
  static let identifier = "ForecastCell"
  
  private enum Layout {
    static let leftMargin: CGFloat = 16
    static let rightMargin: CGFloat = 16
    static let xPadding: CGFloat = 10
    static let yPadding: CGFloat = 4
    
    static let weatherImageSize: CGFloat = 40
  }
  
  // MARK: Subviews
  
  private let dateLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .regular)
    $0.textColor = .white
  }
  private let timeLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 22, weight: .medium)
    $0.textColor = .white
  }
  private let weatherImageView = UIImageView().then {
    let size = Layout.weatherImageSize
    $0.size = CGSize(width: size, height: size)
    $0.contentMode = .scaleAspectFit
  }
  private let temperatureLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .monospacedDigitSystemFont(ofSize: 34, weight: .medium)
  }
  
  // MARK: Life Cycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    contentView.addSubviews(
      dateLabel, timeLabel, weatherImageView, temperatureLabel
    )
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    dateLabel.sizeToFit()
    dateLabel.x = Layout.leftMargin
    dateLabel.center.y = (height - dateLabel.height) / 2 - Layout.yPadding
    
    timeLabel.sizeToFit()
    timeLabel.x = dateLabel.x
    timeLabel.y = dateLabel.maxY
    
    weatherImageView.x = (width / 2) + Layout.xPadding
    weatherImageView.center.y = height / 2
    
    let leftInset = center.x + Layout.xPadding
    let rightInset = width - leftInset - Layout.weatherImageSize
    //날씨 아이콘 아래 선
    separatorInset = UIEdgeInsets(
      top: 0, left: leftInset, bottom: 0, right: rightInset
    )
    
    temperatureLabel.sizeToFit()
    temperatureLabel.x = width - temperatureLabel.width - Layout.rightMargin
    temperatureLabel.center.y = height / 2
  }
  
  // MARK: Configure Cell
  
  func configure(
    date: String,
    time: String,
    imageName: String,
    temperature: String
    ) {
    dateLabel.text = date
    timeLabel.text = time
    weatherImageView.image = UIImage(named: imageName)
    temperatureLabel.text = temperature
  }
}
