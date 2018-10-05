//
//  XkcdAPIAction.swift
//  NetworkingExample-Medium
//
//  Created by Alexey Savchenko on 10/5/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import Foundation
import Alamofire

enum XkcdAPIAction {
  case getComic(comicID: Int)
}

extension XkcdAPIAction: APIAction {
  var method: HTTPMethod {
    switch self {
    case .getComic:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getComic(let comicID):
      return "\(comicID)/info.0.json"
    }
  }
  
  var actionParameters: [String : Any] {
    return [:]
  }
  
  var baseURL: String {
    return "https://xkcd.com/"
  }
  
  var authHeader: [String : String] {
    return [:]
  }
  
  var encoding: ParameterEncoding {
    return URLEncoding.default
  }
}
