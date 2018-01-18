//
//  DirectionInterface.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/11.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

let kAnimationZero = 0
let kAnimationDelay:TimeInterval = 0.1
let kAnimationDuration:TimeInterval = 1
let kAnimationDamping:CGFloat = 0.4
let kAnimationVelocity:CGFloat = 10

class DirectionInterface: TransitionViewController {

    @IBOutlet weak var tOpenButtonConstraints: NSLayoutConstraint!
    @IBOutlet weak var tAnimationLabelConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var tOpenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tTransitionType = .none
        tMoveAction(tOpenButton)
    }
    
    @IBAction func tMoveAction(_ sender: Any) {
        tResetFrame()
        tResetMoveAction()
    }
    
    func tResetFrame(){
        tOpenButtonConstraints.constant -= view.bounds.width
        tAnimationLabelConstraints.constant -= view.bounds.width
    }
    
    func tResetMoveAction(){
        Timer.scheduledTimer(withTimeInterval: kAnimationDelay, repeats: false) { (timer) in
            UIView.animate(withDuration: kAnimationDuration, delay: TimeInterval(kAnimationZero), usingSpringWithDamping: kAnimationDamping, initialSpringVelocity: kAnimationVelocity, options: [.curveEaseIn], animations: {
                self.tAnimationLabelConstraints.constant = CGFloat(kAnimationZero)
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: kAnimationDuration, delay: TimeInterval(kAnimationZero), usingSpringWithDamping: kAnimationDamping+0.03, initialSpringVelocity: kAnimationVelocity, options: [.curveEaseIn], animations: {
                self.tOpenButtonConstraints.constant = CGFloat(kAnimationZero)
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
       
    }


}

