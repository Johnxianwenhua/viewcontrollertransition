//
//  TransitionViewController.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/15.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    
    public var tTransitionType:TransitionAnimationType = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nav = self.navigationController{
           nav.delegate = self
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}

extension TransitionViewController:UINavigationControllerDelegate{

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if tTransitionType == .none {
            return nil
        }
        return Transition(withOperation: operation, animationType:tTransitionType)
    }
}
