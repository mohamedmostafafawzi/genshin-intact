//
//  NetworkService.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import Foundation
import PromiseKit

public protocol NetworkService {
    func fetchRequest<T: Decodable>(forRoute route: EndpointRouter) -> Promise<T>
}
