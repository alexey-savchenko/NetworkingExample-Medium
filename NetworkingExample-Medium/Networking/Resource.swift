//
//  Resource.swift
//  VPN
//
//  Created by Alexey Savchenko on 10/3/18.
//  Copyright © 2018 YaroslavMorozov. All rights reserved.
//

import Foundation
import Alamofire

open class Resource<T> {
  let request: APIAction
  let parse: (Any) -> Result<T>
  
  init(request: APIAction, parse: @escaping (Any) -> Result<T>) {
    self.request = request
    self.parse = parse
  }
}

class RandomComicResource: Resource<Comic> {
  init() {
    let randomNumber = Int.random(in: 1...1000)
    super.init(request: XkcdAPIAction.getComic(comicID: randomNumber)) { (response) -> Result<Comic> in
      if let data = response as? Data,
        let comic = try? JSONDecoder().decode(Comic.self, from: data) {
        return Result.success(comic)
      } else {
        return Result.failure(CustomError(value: "Invalid response"))
      }
    }
  }
}
