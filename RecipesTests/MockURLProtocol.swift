//
//  MockURLProtocol.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/23/24.
//
import Foundation
import Testing

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        if Self.requestHandler == nil {
            print("WARNING: no request handler set, setting 404 error as a response.")
            Self.setResponse(.error(404))
        }
        let handler = Self.requestHandler!
        do {
            let (response, data) = try handler(request)
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            self.client?.urlProtocol(self, didLoad: data)
            self.client?.urlProtocolDidFinishLoading(self)
        } catch {
            self.client?.urlProtocol(self, didFailWithError:error)
        }
    }
    override func stopLoading() {} // not interested
    
    static func setResponseChain(_ responses: [MockResponse]) {
        guard responses.count > 0 else {
            Self.requestHandler = nil
            return
        }
        Self.requestHandler = { request in
            let current = responses.first!
            setResponseChain(Array(responses.dropFirst()))
            return (current.getHTTPResponse(request), current.getData())
        }
    }
    
    static func setResponse(_ response: MockResponse) {
        setResponseChain([response])
    }
    
    static func createMockSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [Self.self]
        return URLSession(configuration: config)
    }
}
