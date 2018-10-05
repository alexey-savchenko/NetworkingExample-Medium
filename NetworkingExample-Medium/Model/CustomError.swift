//
//  CustomError.swift
//  NetworkingExample-Medium
//
//  Created by Alexey Savchenko on 10/5/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
  let value: String
  var localizedDescription: String {
    return value
  }
}
