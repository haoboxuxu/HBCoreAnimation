//
//  UIImageView+TickleMe.swift
//  HBCoreAnimation
//
//  Created by 徐浩博 on 2021/12/14.
//

import UIKit

var dispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())

extension UIImageView {
    func tickleMeAnimation(layer: CALayer, repeatCount: Float, duration: CFTimeInterval, angles: [CGFloat]) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        
        animation.repeatCount = repeatCount
        animation.duration = duration
        animation.values = angles
        
        animation.delegate = self
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: nil)
    }
}

extension UIImageView: CAAnimationDelegate {
    
    @objc private func tickleMe() {
        dispatchSourceTimer.schedule(deadline: .now()+0.1)
        dispatchSourceTimer.setEventHandler { [weak self] in
            DispatchQueue.main.async {
                self?.tickleMeAnimation(layer: self?.layer ?? CALayer(),
                                        repeatCount: 2,
                                        duration: 0.2,
                                        angles: [.pi/15, -.pi/15, .pi/12])
            }
        }
        dispatchSourceTimer.resume()
    }
    
    public func tickleMeAnimationDidStop() {
        
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dispatchSourceTimer.cancel()
        dispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
    }
}

extension UIImageView {
    public func addTickleMeGesture() {
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOne))
        singleTapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(singleTapGesture)

        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(tickleMe))
        doubleTapGesture.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTapGesture)

        singleTapGesture.require(toFail: doubleTapGesture)
    }
    
    @objc private func didTapOne() { }
    
    @objc private func didTapTwo() { }
}
