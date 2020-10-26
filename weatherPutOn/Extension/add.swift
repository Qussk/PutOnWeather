//
//  add.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
}
