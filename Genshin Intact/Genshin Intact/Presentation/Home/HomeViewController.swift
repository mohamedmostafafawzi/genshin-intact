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
        rootView = HomeRootView()
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

