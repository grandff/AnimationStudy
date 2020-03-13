//
//  SimpleUIViewAnimationViewController.swift
//  AnimationStudy
//
//  Created by 김정민 on 2020/03/13.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class SimpleUIViewAnimationViewController: UIViewController {

    /*
        UIView Animation
     1. 기본적인 Animation 효과
     --> Animation 효과가 너무 빨리 지나가서 확인이 힘들다면 시뮬레이터에서 슬로우 애니메이션 옵션을 키면 됨
     */
    
    @IBOutlet weak var redView: UIView!
    
    
    @IBAction func reset(_ sender: Any?) {
        redView.backgroundColor = UIColor.red
        redView.alpha = 1.0
        redView.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
    }
    
    // Animation 처리 (1)
    @objc func animate(){
        var frame = redView.frame
        frame.origin = view.center
        frame.size = CGSize(width: 100, height: 100)
        // 중앙으로 이동 후 Animation 완료 시 자동으로 reset 처리
        UIView.animate(withDuration: 3, animations: {
            self.redView.frame = frame
            self.redView.alpha = 0.5
            self.redView.backgroundColor = UIColor.blue
        }) { (finished) in
            UIView.animate(withDuration: 3) {
                self.reset(nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "실행", style: .done, target: self, action: #selector(animate))
        
        reset(nil)
    }

}
