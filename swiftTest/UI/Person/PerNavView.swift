//
//  PerNavView.swift
//  swiftTest
//
//  Created by Mac on 17/4/13.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit


protocol PerNavViewDeletate: NSObjectProtocol{

    func composeButtonClick()
}

class PerNavView: UIView {

    weak var delegate: PerNavViewDeletate?
    
    private lazy var setIcon = UIImageView(image:UIImage(named:"shezhi_icon"))
    
    private lazy var btn:UIButton = {
        let btn = UIButton(type:.custom)
        btn.addTarget(self, action:#selector(goto), for:.touchUpInside)
        
        return btn
    }()
    
    private lazy var titleLab:UILabel = {
        let lab = UILabel()
        lab.text = "个人中心"
        lab.textColor = RGBA(255, 255, 255, 1)
        lab.font = UIFont.systemFont(ofSize: 15)
    
        return lab
   }()
    
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI(){
        
        self.addSubview(setIcon)
        setIcon.isUserInteractionEnabled = true
        self.addSubview(btn)
        self.addSubview(titleLab)
        
        
        setIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.height.width.equalTo(16)
            make.centerY.equalTo(self)
        }
        
        btn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(50)
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
    }
    
     func goto(){
    
        if self.delegate!.responds(to: Selector(("composeButtonClick"))){
           self.delegate!.composeButtonClick()
        }
    }
}
