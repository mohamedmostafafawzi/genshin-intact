//
//  HomeViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import Foundation

public class HomeViewModel: ViewModelType {
    
    // MARK: - Input & Output
    public var input: HomeViewModel.Input
    public var output: HomeViewModel.Output
    
    public struct Input {
    }
    
    public struct Output {
    }
    
    // MARK: - Properties
    
    // MARK: - Subjects
    
    // MARK: - Initializer
    public init() {
        
        // Configure input & output
        input = Input()
        output = Output()
        
        // Subscribe for input events
    }
    
    // MARK: - Internal logic
    
    // MARK: - Input events subscription

}
