//
//  ViewController.swift
//  WWW
//
//  Created by Chenfy on 16/9/18.
//  Copyright © 2016年 Chenfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor();
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

