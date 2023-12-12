//
//  GradientView.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 12/12/23.
//

import UIKit

public class GradientView: NiblessView {
    
    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()
    var color = UIColor.black
    private var direction = GradientDirection.top
    private let maskLayer = CAShapeLayer()
    
    // MARK: - Initializer
    public init(color: UIColor, direction: GradientDirection) {
        super.init(frame: .zero)
        self.color = color
        self.direction = direction
    }
    
    // MARK: - Methods
    public override func configureViewHierarchy() {
        super.configureViewHierarchy()
        
        // Set up gradient layer
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.locations = [0.0, 1.0]
        
        switch direction {
        case .top:
            gradientLayer.colors = [UIColor.clear.cgColor, color.cgColor]
        case .bottom:
            gradientLayer.colors = [color.cgColor, UIColor.clear.cgColor]
        }
        layer.insertSublayer(gradientLayer, at: 0)
        
        // Set up mask layer
        maskLayer.frame = bounds
        maskLayer.cornerRadius = Dimensions.cornerRadius
        maskLayer.backgroundColor = UIColor.white.cgColor
        layer.mask = maskLayer
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        maskLayer.frame = bounds
    }
}

public enum GradientDirection {
    case top
    case bottom
}
