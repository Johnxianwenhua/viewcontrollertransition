//
//  ScrollInterface.swift
//  AnimationDemo
//
//  Created by holdtime on 2018/1/15.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

class ScrollInterface: TransitionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tTransitionType = .horizontal
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tBackMenu: UIButton!
    
    @IBAction func tBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
