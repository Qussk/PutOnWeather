//
//  gestureRecognizer.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/24.
//

import UIKit

extension WeatherViewController : UIGestureRecognizerDelegate {
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
return true
}
}
