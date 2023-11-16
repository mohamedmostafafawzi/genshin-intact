//
//  ConfigurableCell.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Model
    
    func configure(with: Model)
}
