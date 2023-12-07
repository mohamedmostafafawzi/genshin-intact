//
//  CharacterDetailsViewController.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/16/23.
//

import UIKit
import RxSwift
import RxCocoa

public class CharacterDetailsViewController: NiblessViewController {
    
    // MARK: - Properties
    private var rootView: CharacterDetailsRootView!
    private let viewModel: CharacterDetailsViewModel
    private weak var navigationDelegate: CharacterDetailsViewControllerNavigationDelegate?
    private let disposeBag = DisposeBag()
    public override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    // MARK: - Initializer
    public init(viewModel: CharacterDetailsViewModel,
                navigationDelegate: CharacterDetailsViewControllerNavigationDelegate) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init()
    }
    
    // MARK: - Methods
    public override func loadView() {
        rootView = CharacterDetailsRootView()
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
