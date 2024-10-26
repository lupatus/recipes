//
//  MockResponse.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/23/24.
//
import Foundation

enum MockResponse {
    case data(Data)
    case error(Int)
    
    func getCode() -> Int {
        switch self {
        case .data(_):
            return 200
        case .error(let code):
            return code
        }
    }
    
    func getData() -> Data {
        switch self {
        case .data(let data):
            return data
        case .error(_):
            return "".data(using: .utf8)!
        }
    }
    
    func getHTTPResponse(_ request: URLRequest) -> HTTPURLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: getCode(), httpVersion:nil, headerFields:nil)!
    }
}
