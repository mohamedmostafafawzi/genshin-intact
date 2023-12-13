//
//  BaseRouter.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation

enum ContentRouter: EndpointRouter {
    case getCharacters
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "characters"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getCharacters:
            return [
                "query": "names",
                "matchNames": "false",
                "matchAltNames": "false",
                "matchCategories": "true",
                "verboseCategories": "true"
            ]
        }
    }
    
    var body: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}
