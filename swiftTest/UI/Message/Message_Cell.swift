//
//  Message_Cell.swift
//  swiftTest
//
//  Created by Mac on 17/4/15.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class Message_Cell: UITableViewCell {

    
    lazy var icon = UIImageView(image:UIImage(named:"提醒事项icon"))

    var titleLab:UILabel = {
        let lab = UILabel()
        //lab.text = "个人中心么？"
        lab.textColor = RGBA(25, 55, 105, 1)
        lab.font = UIFont.systemFont(ofSize: 20)
        
        return lab
    }()
    var detailLab:UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.textColor = RGBA(25, 55, 75, 1)
        lab.font = UIFont.systemFont(ofSize: 15)
        
        return lab
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        //self.contentView.backgroundColor = RandomColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setUI(){
        
        self.contentView.addSubview(icon)
        self.contentView.addSubview(titleLab)
        self.contentView.addSubview(detailLab)
        
        let line = UILabel()
        line.backgroundColor = RGBA(35, 78, 33, 1)
        self.contentView.addSubview(line)
        
        icon.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(line.snp.top).offset(-10).priority(300)
            make.height.width.equalTo(60)
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(10)
            make.centerY.equalTo(self.contentView.centerY)
        }
        
        detailLab.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
            make.top.equalTo(titleLab.snp.bottom).offset(10)
            make.bottom.equalTo(line.snp.top).offset(-10).priority(400)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
