//
//  Header.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

let SCREENWIDTH = UIScreen.main.bounds.size.width
let SCREENHEIGHT = UIScreen.main.bounds.size.height
let NAVBAR_HEIGHT = 64
let TABBAR_HEIGHT = 49


func RGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> (UIColor) {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RandomColor() -> (UIColor) {
    return RGBA(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), 1)
}

func getAppDelegate() -> (AppDelegate) {
    
    return (UIApplication.shared.delegate as! AppDelegate)
    
}
