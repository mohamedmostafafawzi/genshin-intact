//
//  BaseRouter.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation

enum ContentRouter: EndpointRouter {
    case getContent(type: GenshinContentType)
    
    var method: HTTPMethod {
        switch self {
        case .getContent:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getContent(let type):
            return type.rawValue
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}
