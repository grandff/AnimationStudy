//
//  UIViewSprintAnimationViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/14.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class UIViewSprintAnimationViewController: UIViewController {

    /*
        Spring Animation & Keyframe Animation
     1. Spring이 튀어오르는 듯한 애니메이션 효과를 줄 수 있음
     --> Damping과 Velocity를 적절히 줘야 어색하지않음
     */
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var velocitySlider: UISlider!
    
    @IBAction func reset(_ sender: Any?) {
        redView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
    }
    
    // Spring Animation 구현 (1)
    @objc func animate(){
        let targetFrame = CGRect(x: view.center.x - 100, y: view.center.y, width: 200, height: 200)
        
        // redview를 targetview로 이동
        // damping : 진폭. 0에 가까울수록 진폭이 커짐.
        // initialSpringVelociy : 속도
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: CGFloat(dampingSlider.value), initialSpringVelocity: CGFloat(velocitySlider.value), options: [], animations: {
            self.redView.frame = targetFrame
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
        
        reset(nil)
    }
}
