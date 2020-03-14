//
//  UIViewKeyframeAnimationViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/14.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class UIViewKeyframeAnimationViewController: UIViewController {

    /*
        Spring Animation & Keyframe Animation
     1. 여러 애니메이션을 실행할 경우 keyframe으로 구성하는게 좋음
     --> 여기선 단계별 애니메이션을 페이즈별로 나눠놨음
     
     */
    
    
    @IBOutlet weak var redView: UIView!
    
    // 단계별 애니메이션
    func phase1(){
        let targetFrame = CGRect(x: view.center.x - 200, y: view.center.y - 200, width: 300, height: 300)
        redView.frame = targetFrame
    }
    
    func phase2(){
        redView.backgroundColor = UIColor.blue
    }
    
    func phase3(){
        let targetFrame = CGRect(x: 50, y: 100, width: 50, height: 50)
        redView.frame = targetFrame
        redView.backgroundColor = UIColor.red
    }
    
    // Keyframe으로 애니메이션 구현(1)
    @objc func animate(){
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.phase1()
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                self.phase2()
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.phase3()
            }
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
    }

}
