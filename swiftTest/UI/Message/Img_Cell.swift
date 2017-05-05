//
//  Img_Cell.swift
//  swiftTest
//
//  Created by Mac on 17/4/16.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class Img_Cell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.frame = CGRect(x:0,y:0,width:SCREENWIDTH,height:SCREENWIDTH/2)
        bottom.priority = 100;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
