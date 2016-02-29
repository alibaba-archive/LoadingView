//
//  LoadingView.swift
//  LoadingView
//
//  Created by ZouLiangming on 16/2/29.
//  Copyright © 2016年 ZouLiangming. All rights reserved.
//

import UIKit

let loadingWidth: CGFloat = 52.0

public class LoadingView: UIView {

    var imageViewLogo: UIImageView!
    var imageViewLoading: UIImageView!

    public class func showInView(view: UIView) {
        let customView = self.sharedView
        let originX = (view.frame.size.width - loadingWidth) / 2.0
        let originY = (view.frame.size.height - loadingWidth) / 2.0

        customView.frame = CGRectMake(originX , originY, loadingWidth, loadingWidth)
        view.addSubview(customView)
        customView.startAnimation()
    }

    public class var sharedView: LoadingView {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : LoadingView? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = LoadingView()
            Static.instance?.commonInit()
        }
        return Static.instance!
    }

    private func commonInit() {
        self.imageViewLogo = UIImageView(frame: CGRectMake(0, 0, loadingWidth, loadingWidth))
        self.imageViewLoading = UIImageView(frame: CGRectMake(0, 0, loadingWidth, loadingWidth))
        self.imageViewLogo.image = getImage("loading_logo")
        self.imageViewLoading.image = getImage("loading_circle")
        self.imageViewLogo.backgroundColor = UIColor.clearColor()
        self.imageViewLoading.backgroundColor = UIColor.clearColor()
        self.backgroundColor = UIColor.clearColor()
        self.addSubview(self.imageViewLogo)
        self.addSubview(self.imageViewLoading)
    }

    func getImage(name: String) -> UIImage {
        let traitCollection = UITraitCollection(displayScale: 3)
        let bundle = NSBundle(forClass: self.classForCoder)
        guard let image = UIImage(named: name, inBundle: bundle, compatibleWithTraitCollection: traitCollection) else { return UIImage() }
        
        return image
    }

    func startAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = Float(CGFloat.max)
        self.imageViewLoading.layer.addAnimation(rotateAnimation, forKey: "rotation")
    }

    public class func stopAnimation() {
        let customView = self.sharedView
        UIView.animateWithDuration(0.5, animations: {
            customView.alpha = 0
            }) { (competition) -> Void in
                customView.imageViewLoading.layer.removeAnimationForKey("rotation")
                customView.removeFromSuperview()
                customView.alpha = 1
        }
    }
}
