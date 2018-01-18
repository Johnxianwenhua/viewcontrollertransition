//
//  Animation.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/15.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

class Animation{
    
    //缩放动画
    class func tAnimationScale(duration:TimeInterval, from:NSNumber, to:NSNumber)->CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = duration
        animation.repeatCount = 1
        animation.autoreverses = false
        animation.fromValue = from
        animation.toValue = to
        return animation
    }
}
