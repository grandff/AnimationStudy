//
//  PropertyAnimatorViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/14.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class PropertyAnimatorViewController: UIViewController {

    /*
        Property Animator
     1. ios 10 이상부터는 Property Animator로 구현하는게 더 좋음
     2. 생성자로 Property Animator 구현 가능
     --> 생성자의 경우 completion과 startanimation을 직접 추가해야함
     */
    
    @IBOutlet weak var redView: UIView!
    var animator : UIViewPropertyAnimator?
    
    func moveAndResize(){
        let targetFrame = CGRect(x: view.center.x - 200, y: view.center.y - 200, width: 300, height: 300)
        redView.frame = targetFrame
    }
    
    @IBAction func reset(_ sender: Any?) {
        redView.backgroundColor = UIColor.red
        redView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
    }
    
    // 애니메이션 일시 중지 (1)
    @IBAction func pause(_ sender: Any) {
        animator?.pauseAnimation()
    }
    
    // Property Animation 구현 (1)
    @IBAction func animate(_ sender: Any) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 7, delay: 0, options: [], animations: {
            self.moveAndResize()
        }) { (position) in
            switch position{
            case .current:
                print("Current")
            case .start:
                print("start")
            case .end:
                print("end")
            default:
                print("unknown")
            }
        }
    }
        
    // 생성자로 Property Animation 구현 (2)
    @IBAction func animate2(_ sender: Any) {
        animator = UIViewPropertyAnimator(duration: 7, curve: .linear, animations: {
            self.moveAndResize()
        })
        
        animator?.addCompletion({ (position) in
            print("Done \(position)")
        })
        
        animator?.startAnimation()
    }
    
    // 애니메이션 재개 (1)
    @IBAction func resume(_ sender: Any) {
        animator?.startAnimation()
    }
    
    // 애니메이션 중지 (1)
    @IBAction func stop(_ sender: Any) {
        animator?.stopAnimation(false)
        animator?.finishAnimation(at: .current)
    }
    
    // 새로운 애니메이션 추가. delayfactor로 지연시간 설정 가능 (1)
    @IBAction func add(_ sender: Any) {
        animator?.addAnimations({
            self.redView.backgroundColor = UIColor.blue
        }, delayFactor: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
