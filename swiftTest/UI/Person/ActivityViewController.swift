//
//  ActivityViewController.swift
//  swiftTest
//
//  Created by Mac on 17/4/13.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class ActivityViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
}
