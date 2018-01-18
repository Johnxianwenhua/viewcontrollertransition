//
//  FirstInterface.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/11.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

class FirstInterface: TransitionViewController {

    @IBOutlet weak var tAnimationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tTransitionType = .open
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tBacktoMenuAction: UIButton!
    @IBAction func tBackToMenuAction(_ sender: Any) {
        tTransitionType = .none
        self.navigationController?.popViewController(animated: true)
    }


}

