//
//  APIActionProtocol.swift
//  VPN
//
//  Created by Alexey Savchenko on 10/3/18.
//  Copyright © 2018 YaroslavMorozov. All rights reserved.
//

import Foundation
import Alamofire

protocol APIAction: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: [String: String] { get }
    var encoding: ParameterEncoding { get }
}

extension APIAction {
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(url: baseURL.appending(path),
                                             method: method,
                                             headers: authHeader)
        let encodedRequest = try encoding.encode(originalRequest,
                                                 with: actionParameters)
        return encodedRequest
    }
}
