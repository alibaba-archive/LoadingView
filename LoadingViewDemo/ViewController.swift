//
//  ViewController.swift
//  LoadingViewDemo
//
//  Created by ZouLiangming on 16/2/29.
//  Copyright © 2016年 ZouLiangming. All rights reserved.
//

import UIKit
import LoadingView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startAnimation(sender: AnyObject) {
        LoadingView.showInView(self.view)
    }
    
    @IBAction func stopAnimation(sender: AnyObject) {
        LoadingView.stopAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

