//
//  Transition.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/15.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

let kTransitionDuration:TimeInterval = 0.3

let kTransitionOpenDurationScale:TimeInterval = 1
let kTransitionOpenDuration:TimeInterval = 0.3
let kTransitionOpenTag = 1001
let kTransitionViewTag = 1002

enum TransitionAnimationType {
    case none
    case open
    case horizontal
}

class Transition: NSObject,UIViewControllerAnimatedTransitioning {
    
    var tTransitionOperation:UINavigationControllerOperation!
    var tTransitionAnimationType:TransitionAnimationType = .none
    var tTransitionContext:UIViewControllerContextTransitioning!
    
    init(withOperation operation:UINavigationControllerOperation, animationType type:TransitionAnimationType) {
        tTransitionOperation = operation
        tTransitionAnimationType = type
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return kTransitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let to:UIViewController = transitionContext.viewController(forKey: .to),let from:UIViewController = transitionContext.viewController(forKey: .from) {
            tTransitionContext = transitionContext
            switch tTransitionOperation {
            case .push:
                tPushAnimation(toViewController: to, fromViewController: from)
            case .pop:
                tPopAnimation(toViewController: to, fromViewController: from)
            default:
                break
            }
        }
    }
    
    func tPushAnimation(toViewController to:UIViewController, fromViewController from:UIViewController){
    
        tTransitionContext.containerView.addSubview(to.view)
        to.view.alpha = 0.0
        
        switch tTransitionAnimationType {
        case .open:
            let fromViewAnimation = from.view.viewWithTag(kTransitionViewTag)
            UIView.transition(with: fromViewAnimation!, duration: kTransitionOpenDuration*2, options: [.curveEaseOut,.transitionFlipFromLeft], animations: {
                
            }) { (finished) in
                UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                    to.view.alpha = 1.0
                }, completion: { (finished) in
                    self.tTransitionContext.completeTransition(true)
                })
            }
        case .horizontal:
            let fromViewAnimation = from.view.viewWithTag(kTransitionViewTag)
            UIView.transition(with: fromViewAnimation!, duration: kTransitionOpenDuration*2, options: [.curveEaseOut,.transitionCurlUp], animations: {
                
            }) { (finished) in
                UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                    to.view.alpha = 1.0
                }, completion: { (finished) in
                    self.tTransitionContext.completeTransition(true)
                })
            }
        default:
            UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                to.view.alpha = 1.0
            }, completion: { (finished) in
                self.tTransitionContext.completeTransition(true)
            })
        }
  
    }
    
    func tPopAnimation(toViewController to:UIViewController, fromViewController from:UIViewController){
      
        tTransitionContext.containerView.insertSubview(to.view, belowSubview: from.view)

        switch tTransitionAnimationType {
        case .open:
            let fromViewAnimation = from.view.viewWithTag(kTransitionViewTag)
            UIView.transition(with: fromViewAnimation!, duration: kTransitionOpenDuration*2, options: [.curveEaseOut,.transitionFlipFromLeft], animations: {
                
            }) { (finished) in
                UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                    from.view.alpha = 0.0
                }, completion: { (finished) in
                    self.tTransitionContext.completeTransition(true)
                })
            }
        case .horizontal:
            let fromViewAnimation = from.view.viewWithTag(kTransitionViewTag)
            UIView.transition(with: fromViewAnimation!, duration: kTransitionOpenDuration*2, options: [.curveEaseOut,.transitionCurlDown], animations: {
                
            }) { (finished) in
                UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                    from.view.alpha = 0.0
                }, completion: { (finished) in
                    self.tTransitionContext.completeTransition(true)
                })
            }
        default:
            UIView.animate(withDuration: kTransitionOpenDuration, animations: {
                from.view.alpha = 0.0
            }, completion: { (finished) in
                self.tTransitionContext.completeTransition(true)
            })
        }
        
    }

}
