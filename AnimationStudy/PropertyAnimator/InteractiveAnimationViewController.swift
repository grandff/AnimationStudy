//
//  InteractiveAnimationViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/14.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class InteractiveAnimationViewController: UIViewController {

    /*
        Property Animator
     1. fractionComplete를 통해 애니메이션 진행상황을 확인할 수 있음
     
     */
    
    @IBOutlet weak var redView: UIView!
    var animator : UIViewPropertyAnimator?
    
    func moveAndResize(){
        let targetFrame = CGRect(x: view.center.x - 200, y: view.center.y - 200, width: 300, height: 300)
        redView.frame = targetFrame
        redView.backgroundColor = UIColor.blue
    }
    
    @objc func animate(){
        animator?.startAnimation()
    }
    
    // Fraction Complete를 통해 확인 (1)
    @IBAction func sliderChanged(_ sender: UISlider) {
        animator?.fractionComplete = CGFloat(sender.value)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIViewPropertyAnimator(duration: 7, curve: .linear, animations: {
            self.moveAndResize()
        })
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
    }
}
