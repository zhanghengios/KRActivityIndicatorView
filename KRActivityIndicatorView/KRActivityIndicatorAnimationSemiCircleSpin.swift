//
//  KRActivityIndicatorAnimationSemiCircleSpin.swift
//  KRActivityIndicatorViewDemo
//
// The MIT License (MIT)

// Originally written to work in iOS by Vinh Nguyen in 2016
// Adapted to OSX by Henry Serrano in 2017

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Cocoa

class KRActivityIndicatorAnimationSemiCircleSpin: KRActivityIndicatorAnimationDelegate {
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: NSColor) {
        let duration: CFTimeInterval = 0.6
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        animation.keyTimes = [0, 0.5, 1]
        animation.values = [0, Float.pi, 2 * Float.pi]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = KRActivityIndicatorShape.circleSemi.layerWith(size: size, color: color)
        let frame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: (layer.bounds.height - size.height) / 2,
            width: size.width,
            height: size.height
        )
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
