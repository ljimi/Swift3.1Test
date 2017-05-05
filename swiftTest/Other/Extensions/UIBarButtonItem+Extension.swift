//
//  UIBarButtonItem+Extension.swift
//
//
//  Created by Mac on 15/12/5.
//  Copyright © 2015年 Mac. All rights reserved.
//

import UIKit

// item字体大小
let ItemTitleFontSize: CGFloat = 14
// item字体颜色
let ItemTitleColor: UIColor = UIColor(white: 80 / 255, alpha: 1)

extension UIBarButtonItem{
    
    
    convenience init(target: AnyObject?, action: Selector,imgName: String? = nil,HimgName: String? = nil) {
        self.init()
        
        let button = UIButton()
        // 添加点击事件
        button.addTarget(target, action: action, for: .touchUpInside)
        
        
        button.setImage(UIImage(named: imgName!), for: .normal)
        button.setImage(UIImage(named: HimgName!), for: .highlighted)
        
        
        
        // 设置大小
        button.sizeToFit()
        
        customView = button
    }
}
