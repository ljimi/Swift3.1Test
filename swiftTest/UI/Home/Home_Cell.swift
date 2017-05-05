//
//  Home_Cell.swift
//  swiftTest
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class Home_Cell: UICollectionViewCell {
    
    var imgView = UIImageView()
    var titleLabel = UILabel()

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        //初始化各种控件
        imgView = UIImageView()
        imgView.image = UIImage(named:"headerImg")
        self.contentView.addSubview(imgView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        titleLabel.textColor = .lightGray
        titleLabel.textAlignment = .center
        titleLabel.text = "薰衣草"
        self.contentView.addSubview(titleLabel)
    
        imgView.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self.contentView)
        })
        titleLabel.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.top.equalTo(imgView.snp.bottom)
            make.height.equalTo(20)
        })
        
    
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


