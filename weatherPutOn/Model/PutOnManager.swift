//
//  PutOnManager.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/11/06.
//

import Foundation


class PutOnManager{
  let putonArray = [Category(spring: "spring01", summer: "summer01", fall: "fall01", winter: "winter01"),
                                     Category(spring: "spring02", summer: "summer02", fall: "fall02", winter: "winter02"),
                                     Category(spring: "spring03", summer: "summer03", fall: "fall03", winter: "winter03"),
                                     Category(spring: "spring04", summer: "summer04", fall: "fall04", winter: "winter04"),
                                     Category(spring: "spring05", summer: "summer05", fall: "fall05", winter: "winter05"),
                                     Category(spring: "spring06", summer: "summer06", fall: "fall06", winter: "winter06"),
                                     Category(spring: "spring07", summer: "summer07", fall: "fall07", winter: "winter07"),
                                     Category(spring: "spring08", summer: "summer08", fall: "fall08", winter: "winter08")]

  
var num = 0


  //이미지 넘기기
   func nextImage() {
     num += 1
  }
  
  //계절별 이미지 주기
  func springImage() -> String {
    return putonArray[num].spring
  }
  func summerImage() -> String {
    return putonArray[num].summer
  }
  func fallImage() -> String {
    return putonArray[num].fall
  }
  func winterImage() -> String {
    return putonArray[num].winter
  }

}
