//
//  HomeRootView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/19/23.
//

import UIKit

class HomeRootView: NiblessView {
    
    // MARK: - Views
    private let logoImageView = UIImageView().style(tintColor: .homeTopIcon,
                                                    image: UIImage(named: "home-logo"),
                                                    contentMode: .scaleAspectFit)
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    // MARK: - Initializer
    init(
        collectionViewDataSourceConfigurator:
            CollectionViewDataSourceConfigurator
    ) {
        super.init(frame: .zero)
        collectionViewDataSourceConfigurator(collectionView)
    }
    
    // MARK: - Methods
    override func viewHierarchyDidConfigure() {
        collectionView.registerCellFromClass(CharactersCollectionViewCell.self)
        backgroundColor = .background
    }
}

// MARK: - Layout
extension HomeRootView {
    override func configureViewHierarchy() {
        add(logoImageView, then: {
            $0.anchor(.top(safeAreaLayoutGuide.topAnchor, constant: 8))
            $0.constrainHeight(50)
            $0.constrainWidth(150)
            $0.centerXToSuperview()
        })
        
        add(collectionView, then: {
            $0.anchor(.leading(safeAreaLayoutGuide.leadingAnchor),
                      .top(logoImageView.bottomAnchor, constant: 16),
                      .trailing(safeAreaLayoutGuide.trailingAnchor),
                      .bottom(safeAreaLayoutGuide.bottomAnchor))
        })
        
    }
}
