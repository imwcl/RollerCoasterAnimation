//
//  ViewController.swift
//  RollerCoasterAnimation
//
//  Created by 王崇磊 on 16/5/25.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// 思路详解可以去我的CSDN博客地址观看http://blog.csdn.net/wang631106979/article/details/51737456

import UIKit

@IBDesignable

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rollerLayer = RollerCoasterLayer(frame: view.bounds)
        view.layer.addSublayer(rollerLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

