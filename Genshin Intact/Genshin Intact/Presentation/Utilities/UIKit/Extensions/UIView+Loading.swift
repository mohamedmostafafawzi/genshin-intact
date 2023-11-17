//
//  UIView+Loading.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Loader management
extension UIView {
    /// Sets the visibility of the view's associated loader
    public func setLoadingState(to isLoading: Bool, color: UIColor = .activityIndicator) {
        let loader = addLoaderView(color: color)
        isLoading ? loader.startAnimating() : loader.stopAnimating()
    }
    
    /// Sets the color of the view's loader
    public func setLoaderColor(to color: UIColor) {
        _ = addLoaderView(color: color)
    }
    
    /// Gets view's associated loader
    public var loaderView: UIActivityIndicatorView? {
        return subviews.first(where: { $0.tag == loaderViewTag }) as? UIActivityIndicatorView
    }
}

// MARK: - Reactive
extension Reactive where Base: UIView {
    /// Sets the visibility of the view's associated loader
    public var isLoading: Binder<Bool> {
        return Binder(self.base) { view, isLoading in
            view.setLoadingState(to: isLoading)
        }
    }
}

// MARK: - Helpers
extension UIView {
    private var loaderViewTag: Int { 9876 }
    
    private func addLoaderView(color: UIColor) -> UIActivityIndicatorView {
        // Check if loader view is already added
        if let loaderView = loaderView {
            loaderView.color = color
            return loaderView
        } else {
            // Add loader view
            let activityIndicator = UIActivityIndicatorView().style(color: color)
            activityIndicator.tag = loaderViewTag
            add(activityIndicator, then: {
                $0.centerYTo(centerYAnchor)
                $0.centerXTo(centerXAnchor)
            })
            
            return activityIndicator
        }
    }
}
