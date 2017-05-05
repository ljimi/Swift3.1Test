//
//  TabbarController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(childController: HomeViewController(), imgName: "iconHover", SelectedImgName: "homeicon", title: "首页")
        
        addChildViewController(childController: SearchViewController(), imgName: "jiankongicon-hover", SelectedImgName: "jiankong_icon", title: "搜索")
        
        addChildViewController(childController: MessageViewController(), imgName: "guanliicon-hover", SelectedImgName: "guanli_icon", title: "消息")
        
        addChildViewController(childController: PersonViewController(), imgName: "personicon-hover", SelectedImgName: "person_icon", title: "个人")
       

    }

    // 添加子控制器
    func addChildViewController(childController: UIViewController, imgName: String,SelectedImgName:String,title:String) {
        
        childController.title = title
        
        // 设置图片
        childController.tabBarItem.image = UIImage(named: imgName)
        // 渲染图片以原样显示
        childController.tabBarItem.selectedImage = UIImage(named:SelectedImgName)
        
        // 设置 tabbar title 颜色
        
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBA( 42, 50, 69, 0.6)], for: .normal)
       
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBA( 29, 137, 207, 1)], for: .selected)

        // 添加子控制器
        addChildViewController(NavigationController(rootViewController: childController))
    }
    

}
