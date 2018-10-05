//
//  ComicViewControllerModel.swift
//  NetworkingExample-Medium
//
//  Created by Alexey Savchenko on 10/5/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import Foundation
import Alamofire

struct ComicViewControllerModel {
  
  private let api = API()
  
  func getRandomComic(_ completion: @escaping (Result<Comic>) -> Void) {
    api.request(RandomComicResource(), completion: completion)
  }
}
