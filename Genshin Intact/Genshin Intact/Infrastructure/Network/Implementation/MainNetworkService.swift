//
//  MainNetworkService.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

class MainNetworkService: NetworkService {
    
    // MARK: - Methods
    func fetchRequest<T: Decodable>(forRoute route: EndpointRouter) -> Promise<T> {
        return Promise<T> { seal in
            do {
                let urlRequest = try route.asURLRequest()
                
                URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                    // Log response body if possible
                    if let data = data, let decodedResponseBody = String(data: data, encoding: .utf8) {
                        print("LOG:: 🔗 \(urlRequest.url!) - ✅ Data: \(decodedResponseBody)")
                    }
                    
                    // Check for errors
                    if let httpResponse = response as? HTTPURLResponse,
                       !(200 ... 299).contains(httpResponse.statusCode) {
                        print("LOG:: 🔗 \(urlRequest.url!) - ⚠️ Error: \(response.debugDescription)")
                                                
                        // handle default errors
                        switch httpResponse.statusCode {
                        case 400: seal.reject(GIError.badAPIRequest)
                        case 404: seal.reject(GIError.notFound)
                        default: seal.reject(GIError.unknown)
                        }
                        return
                    }
                    
                    // Try to decode response
                    do {
                        guard let data = data else {
                            print("LOG:: 🔗 \(urlRequest.url!) - ⚠️ Doesn't have any data")
                            seal.reject(GIError.decodingIssue)
                            return
                        }
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        seal.fulfill(decodedObject)
                    } catch {
                        print("LOG:: 🔗 \(urlRequest.url!) - ⚠️ Decoding error: \(error)")
                        seal.reject(GIError.decodingIssue)
                    }
                }.resume()
            } catch {
                seal.reject(GIError.unknown)
            }
        }
    }
}
