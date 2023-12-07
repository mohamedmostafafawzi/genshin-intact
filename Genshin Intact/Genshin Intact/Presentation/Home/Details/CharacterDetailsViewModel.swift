//
//  CharacterDetailsViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import RxSwift
import RxCocoa
public class CharacterDetailsViewModel: ViewModelType {
    
    // MARK: - Input & Output
    public var input: CharacterDetailsViewModel.Input
    public var output: CharacterDetailsViewModel.Output
    
    public struct Input {
        
    }
    
    public struct Output {
        let character: PublishSubject<Character>
    }
        
    // MARK: - Subjects
    private let characterSubject = PublishSubject<Character>()
    
    // MARK: - Properties
    private weak var navigationDelegate: CharacterDetailsViewControllerNavigationDelegate?
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    public init(character: Character,
                navigationDelegate: CharacterDetailsViewControllerNavigationDelegate) {
        
        self.navigationDelegate = navigationDelegate
        
        characterSubject.onNext(character)
        
        // Configure input & output
        input = Input()
        output = Output(character: characterSubject)
    }
    
    // MARK: - Internal logic
    
    
    // MARK: - Input events subscription
    
}
