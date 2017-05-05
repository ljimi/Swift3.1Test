//
//  GuideViewController.swift
//  swiftTest
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

let pageCount = 3

class GuideViewController: BaseViewController ,UIScrollViewDelegate{
    
    
    
    private lazy var guideScrollView:UIScrollView = {
        
        let scrollView = UIScrollView(frame:CGRect(x:0,y:0,width:SCREENWIDTH,height:SCREENHEIGHT))
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        for i in 0...(pageCount - 1){
            
            let imagView = UIImageView(frame:CGRect(x:CGFloat(i) * SCREENWIDTH,y:0,width:SCREENWIDTH,height:SCREENHEIGHT))
            
            imagView.image = UIImage(named:"wm_newGuide_pic_" + String(i + 1))
            if i == pageCount - 1 {
                
                let btn = UIButton(type:.custom)
                btn.bounds = CGRect(x:0,y:0,width:200,height:50)
                btn.center = CGPoint(x:SCREENWIDTH * 0.5,y:SCREENHEIGHT * 0.65)
                btn.setTitle("开始", for: .normal)
                btn.titleLabel?.tintColor = .white
                btn.layer.masksToBounds = true
                btn.layer.cornerRadius = 6
                btn.backgroundColor = .orange
                btn.addTarget(self, action: #selector(gotoRoot), for: .touchUpInside)
                imagView.isUserInteractionEnabled = true
                imagView.addSubview(btn)
            }
            
            scrollView.addSubview(imagView)
        }
        
    
        scrollView.contentSize = CGSize(width:3 * SCREENWIDTH,height: SCREENHEIGHT)
        
        return scrollView
        
    }()
    
    private lazy var pageControll:UIPageControl = {
       
        let pageControll = UIPageControl()
        pageControll.numberOfPages = pageCount
        pageControll.currentPageIndicatorTintColor = RGBA(253, 98, 42, 1)
        pageControll.pageIndicatorTintColor = RGBA(189, 189, 189, 1)
        pageControll.center = CGPoint(x:SCREENWIDTH * 0.5,y:SCREENHEIGHT - 50)
        
        return pageControll
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(guideScrollView)
        self.view.addSubview(pageControll)
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageNum:CGFloat = scrollView.contentOffset.x / SCREENWIDTH
        
        
        pageControll.currentPage = Int(pageNum + 0.5)
        
    }
    
    
   @objc private func gotoRoot(){
    
        //(UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = TabbarController()
    
        getAppDelegate().window?.rootViewController = TabbarController()

        print("hahaha")
        
    }
    
}
