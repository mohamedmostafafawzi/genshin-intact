//
//  HomeViewModel.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import RxSwift
import RxCocoa
public class HomeViewModel: ViewModelType {
    
    // MARK: - Input & Output
    public var input: HomeViewModel.Input
    public var output: HomeViewModel.Output
    
    public struct Input {
        let loadCharacters = PublishSubject<()>()
        let characterSelected = PublishSubject<CharactersCollectionViewCellViewModel>()
    }
    
    public struct Output {
        let characters: Driver<[CharactersCollectionViewCellViewModel]>
        let isLoading: Driver<Bool>
    }
        
    // MARK: - Subjects
    private let charactersSubject = BehaviorRelay<[CharactersCollectionViewCellViewModel]>(value: [])
    private let isLoadingSubject = BehaviorSubject<Bool>(value: false)
    
    // MARK: - Properties
    private weak var navigationDelegate: HomeViewControllerNavigationDelegate?
    private let contentUseCase: ContentUseCase
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    public init(navigationDelegate: HomeViewControllerNavigationDelegate,
                contentUseCase: ContentUseCase) {
        
        self.navigationDelegate = navigationDelegate
        self.contentUseCase = contentUseCase
        
        // Configure input & output
        input = Input()
        output = Output(characters: charactersSubject.asDriver(onErrorJustReturn: []),
                        isLoading: isLoadingSubject.asDriver(onErrorJustReturn: false))
        
        // Subscribe for input events
        subscribeToLoadCharacters()
        subscribeToCharacterSelected()
    }
    
    // MARK: - Internal logic
    private func loadCharacters() {
        isLoadingSubject.onNext(true)
        _ = contentUseCase.getCharacters()
            .map { $0.map { CharactersCollectionViewCellViewModel(from: $0) } }
            .done { [weak self] in
                self?.charactersSubject.accept($0)
                self?.isLoadingSubject.onNext(false)
            }
    }
    
    // MARK: - Input events subscription
    private func subscribeToLoadCharacters() {
        input.loadCharacters.subscribe(onNext: { [weak self] in
            self?.loadCharacters()
        }).disposed(by: disposeBag)
    }
    
    private func subscribeToCharacterSelected() {
        input.characterSelected.subscribe(onNext: { [weak self] character in
            // TODO: - Navigate to details
            
        }).disposed(by: disposeBag)
    }
}
