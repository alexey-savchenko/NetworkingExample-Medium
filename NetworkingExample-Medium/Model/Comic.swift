//
//  Comic.swift
//  NetworkingExample-Medium
//
//  Created by Alexey Savchenko on 10/5/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import Foundation

struct Comic: Codable {
  let month: String
  let num: Int
  let link, year, news, safeTitle: String
  let transcript, alt: String
  let img: String
  let title, day: String
  
  enum CodingKeys: String, CodingKey {
    case month, num, link, year, news
    case safeTitle = "safe_title"
    case transcript, alt, img, title, day
  }
}
