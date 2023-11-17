//
//  LaunchViewController.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit
import RxSwift
import RxCocoa

public class LaunchViewController: NiblessViewController {
    
    // MARK: - Properties
    private var rootView: LaunchRootView!
    private let viewModel: LaunchViewModel
    private weak var navigationDelegate: LaunchViewControllerNavigationDelegate?
    private let disposeBag = DisposeBag()
    public override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    // MARK: - Initializer
    public init(viewModel: LaunchViewModel,
                navigationDelegate: LaunchViewControllerNavigationDelegate) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init()
    }
    
    // MARK: - Methods
    public override func loadView() {
        rootView = LaunchRootView()
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
