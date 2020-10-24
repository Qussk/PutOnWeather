//
//  frames.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import UIKit

extension CGRect {
  static var screenBounds: CGRect { UIScreen.main.bounds }//screenBounds: 화면에 꽉차게

  //CGRect에 대한 부분 init으로 하나 만들어서 간단하게 처리.
  init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
    self.init(x: x, y: y, width: width, height: height)
  }
}
//가로크기 구하기
extension CGFloat {
  public static let screenWidth = UIScreen.main.bounds.size.width
}


//간소화
extension UIView {
  var x: CGFloat {
    get { frame.origin.x }
    set { frame.origin.x = newValue }
  }
  var y: CGFloat {
    get { frame.origin.y }
    set { frame.origin.y = newValue }
  }
  var width: CGFloat {
    get { frame.width }
    set { frame.size.width = newValue }
  }
  var height: CGFloat {
    get { frame.height }
    set { frame.size.height = newValue }
  }
  var size: CGSize {
    get { frame.size }
    set { frame.size = newValue }
  }
  var maxX: CGFloat { frame.origin.x + frame.size.width }
  var maxY: CGFloat { frame.origin.y + frame.size.height }
}

