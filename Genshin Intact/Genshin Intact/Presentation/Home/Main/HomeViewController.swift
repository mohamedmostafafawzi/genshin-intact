//
//  ViewController.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import UIKit
import RxSwift
import RxCocoa

public class HomeViewController: NiblessViewController {
    
    // MARK: - Properties
    private var rootView: HomeRootView!
    private let viewModel: HomeViewModel
    private weak var navigationDelegate: HomeViewControllerNavigationDelegate?
    private let disposeBag = DisposeBag()
    public override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    // MARK: - Initializer
    public init(viewModel: HomeViewModel,
                navigationDelegate: HomeViewControllerNavigationDelegate) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init()
    }
    
    // MARK: - Methods
    public override func loadView() {
        rootView = HomeRootView(
            collectionViewDataSourceConfigurator: configureCharactersCollectionView(collectionView:)
        )
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.input.loadCharacters.onNext(())
    }
    
}

// MARK: - Configure Characters Collection View
extension HomeViewController {
    private func configureCharactersCollectionView(collectionView: UICollectionView) {
        collectionView.delegate = self
        viewModel.output.characters
            .drive(
            collectionView.rx.items(
                cellIdentifier: CharactersCollectionViewCell.reuseIdentifier,
                cellType: CharactersCollectionViewCell.self
            )
        ) { (_, model, cell) in
            cell.configure(with: model)
        }.disposed(by: disposeBag)
        
        collectionView.rx
            .modelSelected(CharactersCollectionViewCellViewModel.self)
            .subscribe(onNext: { [weak self] Character in
                self?.viewModel.input.characterSelected.onNext(Character)
            }).disposed(by: disposeBag)
    }
}

// MARK: - Characters Collection View Delegates
extension HomeViewController: UICollectionViewDelegateFlowLayout,
                                         UICollectionViewDelegate {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.bounds.width) / 3.5
        return CGSize(width: width, height: 180)
    }
}
