//
//  Alamofire+Result.swift
//  VPN
//
//  Created by Alexey Savchenko on 10/3/18.
//  Copyright © 2018 YaroslavMorozov. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.Result {
    public func flatMap2<T>(_ transform: (Value) throws -> Result<T>) -> Result<T> {
        switch self {
        case .success(let value):
            do {
                return try transform(value)
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
