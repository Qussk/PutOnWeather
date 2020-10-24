//
//  then.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import Foundation

protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
  func then(_ configure: (Self) -> Void) -> Self {
    configure(self)
    return self
  }
}

/*
import Foundation

protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
  func then(_ configure: (Self) -> Void) -> Self {
    configure(self) //셀프를 받아서 --> 셀프 왜써? $0임을 알려줘여하기 떄문에
    return self //셀프를 리턴
    
    //타입 : Self -> void를 뱉는 함수타입.
  }
}

 then은 프로토콜임
 extension으로 NSObject을 채택,
 
 //프로토콜 채택하면서도, AnyObject인 경우. AnyObject은 클래스타입임. 클래스 타입일 떄 이 작업을 해라.
 extension Then where Self: AnyObject {
 
 */
