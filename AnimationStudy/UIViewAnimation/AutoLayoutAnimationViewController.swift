//
//  AutoLayoutAnimationViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/14.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class AutoLayoutAnimationViewController: UIViewController {

    /*
        Spring Animation & Keyframe Animation
     1. 제약에 애니메이션을 적용할 경우 기존의 애니메이션과 다르게 적용해야함
     
     */
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    // 제약에 애니메이션 추가 (1)
    @objc func animate(){
        self.widthConstraint.constant = 400
        self.heightConstraint.constant = 400
        redView.setNeedsUpdateConstraints()
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
    }
}
