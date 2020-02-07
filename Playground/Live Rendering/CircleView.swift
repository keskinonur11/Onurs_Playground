//
//  CircleView.swift
//  Playground
//
//  Created by Onur Keskin on 7.02.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    @IBInspectable var circleLayerColor: UIColor = UIColor.red {
        didSet { updateCircleProperties() }
    }    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet { updateCircleProperties() }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutCircle()
    }
    
    func layoutCircle() {
        if circleLayer == nil {
            circleLayer = CAShapeLayer()
            layer.addSublayer(circleLayer)
            
            let rect = bounds.insetBy(dx: borderWidth / 2, dy: borderWidth / 2)
            let path = UIBezierPath(ovalIn: rect)
            circleLayer.fillColor = circleLayerColor.cgColor
            circleLayer.lineWidth = borderWidth
            circleLayer.path = path.cgPath
        }
    }
    
    func updateCircleProperties() {
        if circleLayer != nil {
            circleLayer.fillColor = circleLayerColor.cgColor
            circleLayer.lineWidth = borderWidth
        }
    }
}
