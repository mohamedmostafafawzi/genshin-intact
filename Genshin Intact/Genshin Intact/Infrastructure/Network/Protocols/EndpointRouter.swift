//
//  EndpointRouter.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation

public protocol EndpointRouter {
    
    // MARK: - Properties
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var body: [String: Any]? { get }
    
    // MARK: - Methods
    func asURLRequest() throws -> URLRequest
}

// MARK: - Default behavior
extension EndpointRouter {
    func asURLRequest() throws -> URLRequest {
        // Construct endpoint path
        let endpointPath = "\(Config.baseURL)\(path)"
        var components = URLComponents(string: endpointPath)
        
        // Configure URL components (If possible)
        if let parameters = parameters {
            components?.queryItems = parameters.map { key, value in URLQueryItem(name: key, value: "\(value)") }
        }
        
        // Configure URL request
        guard let url = components?.url else { throw GIError.invalidEndPoint }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(Config.HTTPHeaderFieldValue.json.rawValue,
                            forHTTPHeaderField: Config.HTTPHeaderFieldKey.contentType.rawValue)
        
        // Construct HTTP body (If possible)
        if let body = body {
            let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            urlRequest.httpBody = data
        }
        
        return urlRequest
    }
}
