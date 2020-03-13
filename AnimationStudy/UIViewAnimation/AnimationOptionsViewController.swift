//
//  AnimationOptionsViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/13.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class AnimationOptionsViewController: UIViewController {

    /*
        UIView Animation
     1. Animation Option 설정을 통해 다양한 기능 추가 가능
     --> 시작 지점 지연 가능
     --> Options는 여러개 전달 가능함
     --> Animation 중에는 터치 옵션이 안되므로 allowuserinteraction을 추가해야함
     2. 실행 중인 애니메이션 중지 가능
     */
    
    @IBOutlet weak var redView: UIView!
    
    @IBAction func reset(_ sender: Any?) {
        redView.backgroundColor = UIColor.red
        redView.alpha = 1.0
        redView.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
    }
    
    // 실행 중인 애니메이션 중지(2)
    @IBAction func stop(_ sender: Any) {
        redView.layer.removeAllAnimations()
        reset(nil)
    }
    
    @objc func animate(){
        let animations : () -> () = {
            var frame = self.redView.frame
            frame.origin = self.view.center
            frame.size = CGSize(width: 100, height: 100)
            self.redView.frame = frame
            self.redView.alpha = 0.5
            self.redView.backgroundColor = UIColor.blue
        }
        
        // Animation options (1)
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: animations, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
        
        reset(nil)
    }
}
