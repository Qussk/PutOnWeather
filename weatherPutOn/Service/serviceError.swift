//
//  serviceError.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation

//에러핸들링 - 에러정의
enum ServiceError: Error {
  case invalidURL//URL에러
  case clientError(Error)//클라이언트에러
  case invalidStatusCode //영향없는코드
  case noData //데이터없음
  case decodingError(Error) //디코딩실패
}


/*
 clientError - 나에게 에러
 invalidStatusCode - 200~300, 300~400까지 허용가능하나, 400,500대는 클라이언트 및 서버에러
 
 */
