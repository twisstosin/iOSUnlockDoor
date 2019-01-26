//
//  ViewController.swift
//  iOSUnlockDoor
//
//  Created by Tosin Omotoyinbo on 1/26/19.
//  Copyright © 2019 Tosin Omotoyinbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    
    let shapeLayer = CAShapeLayer();
    
    var progressTicker : Float = 0;
    
    var basicAnimation : CABasicAnimation!
    
    var animLayer: CALayer {
        return animationView.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        
        basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.duration = 0.5
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    func setupLayer() {
        let center = animationView.center
        
        // create my track layer
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 60, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor(red:0.13, green:0.14, blue:0.14, alpha:1.0).cgColor
        trackLayer.lineWidth = 7
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer .strokeColor = UIColor(red:0.86, green:0.22, blue:0.37, alpha:1.0).cgColor
        shapeLayer.lineWidth = 7
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
    }
    
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        basicAnimation.fromValue = progressTicker
        
        progressTicker = progressTicker + 0.20
        
        basicAnimation.toValue = progressTicker
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
}

