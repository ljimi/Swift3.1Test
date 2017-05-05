//
//  NavigationController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController,UIGestureRecognizerDelegate {

    var pan = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().barTintColor = RGBA(29, 137, 207, 1)
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont(name: "Heiti SC", size: 15.0) as Any,NSForegroundColorAttributeName:RGBA(255, 255, 255, 1)]
        
        self.interactivePopGestureRecognizer?.isEnabled = false
        let target = self.interactivePopGestureRecognizer?.delegate
        let handleTransition = Selector(("handleNavigationTransition:"))
    
        pan = UIPanGestureRecognizer(target:target,action:handleTransition)
        pan.delegate = self;
        self.view.addGestureRecognizer(pan)
    }

    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        /**
         *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
         */
        return self.viewControllers.count != 1
            //&& !((self.value(forKey: "_isTransitioning")).boolValue)
    }
    
    /**
     *  重写这个方法目的：能够拦截所有push进来的控制器
     *
     *  @param viewController 即将push进来的控制器
     */
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true;
            
            /* 设置导航栏上面的内容 */
        
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(target:self,action:#selector(NavigationController.back),imgName:"BackIcon",HimgName:"BackIcon")
       
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(target:self,action:#selector(NavigationController.nol),imgName:"",HimgName:"")
            
        }
        super.pushViewController(viewController, animated: true)
    }
    
 
    
    func back(){
        self.popViewController(animated: true)
    }
 
    func nol(){
        
    }
    

}
