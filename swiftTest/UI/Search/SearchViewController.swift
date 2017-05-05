//
//  SearchViewController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    
    private lazy var titleLab:UILabel = {
        
        let titleLab = UILabel()
        titleLab.text = "发点东西"
        titleLab.textAlignment = .center
        titleLab.font = UIFont.systemFont(ofSize: 16)
        titleLab.textColor = .white
        titleLab.sizeToFit()
        return titleLab
        
    }()
    
    private lazy var scroll:UIScrollView = {
        
        let scroll = UIScrollView(frame:CGRect(x:0,y:0,width:SCREENWIDTH,height:SCREENHEIGHT))

        return scroll
        
    }()
    
    private lazy var nameLab:UILabel = {
        
        let nameLab = UILabel(frame:CGRect(x:0,y:0,width:SCREENWIDTH,height:80))
        nameLab.text = "这是一个小故事"
        nameLab.textAlignment = .center
        nameLab.textColor = .black
        nameLab.font = UIFont.systemFont(ofSize: 16)
       
        return nameLab
        
    }()
    
    private lazy var web:UIWebView = {
        
        let web = UIWebView(frame:CGRect(x:0,y:0,width:SCREENWIDTH,height:1))
        
        let path = Bundle.main.path(forResource: "test", ofType: "html")
        let urlStr = NSURL.fileURL(withPath: path!)
        
        web.loadRequest(NSURLRequest(url: urlStr) as URLRequest)
        
        web.scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        return web
        
    }()
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
        if keyPath == "contentSize" {
            
            
            var fitSize = CGSize()
            
            fitSize = web.sizeThatFits(.zero)
            
            web.frame = CGRect(x:0, y:nameLab.frame.maxY, width:SCREENWIDTH, height:fitSize.height)
            scroll.contentSize = CGSize(width:SCREENWIDTH, height:web.frame.maxY)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
        self.view.addSubview(scroll)
        scroll.addSubview(nameLab)
        scroll.addSubview(web)
        
    }

    private func setNav(){
        
        self.navigationItem.titleView = titleLab
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(target:self,action:#selector(ppp),imgName:"photo",HimgName:"photo")
        
    }
    
    @objc private func ppp(){
        
        
    }
    
    deinit {
        removeObserver(self, forKeyPath: "contentSize")
    }
    
}
