//
//  MotionEffectViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/15.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class MotionEffectViewController: UIViewController {

    /*
        Motion Effect
     1. 핸드폰 움직임에 따른 motion effect 구현
     --> 시뮬레이터에서 확인은 어렵고 핸드폰으로 직접 봐야함
     */
    
    @IBOutlet weak var targetImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // motion effect 구현 (1)
        let x = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        x.minimumRelativeValue = -100
        x.maximumRelativeValue = 100
        
        let y = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        y.minimumRelativeValue = -100
        y.maximumRelativeValue = 100
        
        // addMotionEffect에서 하나씩 추가해도 되지만 group으로 한번에 처리할 수 있음
        let group = UIMotionEffectGroup()
        group.motionEffects = [x,y]
        
        targetImageView.addMotionEffect(group)     
    }
}
