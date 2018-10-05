//
//  API.swift
//  VPN
//
//  Created by Alexey Savchenko on 10/3/18.
//  Copyright © 2018 YaroslavMorozov. All rights reserved.
//

import Foundation
import Alamofire

protocol APIProtocol {
  func request<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void)
}

struct API: APIProtocol {
  func request<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
    Alamofire
      .request(resource.request)
      .responseData { (dataResponse) in
        completion(dataResponse.result.flatMap2(resource.parse))
    }
  }
}
