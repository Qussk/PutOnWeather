//
//  StringExtension.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/05.
//

import UIKit

extension String {
  func size(with font: UIFont) -> CGSize {
    return (self as NSString).size(withAttributes: [.font : font])
  }
}
