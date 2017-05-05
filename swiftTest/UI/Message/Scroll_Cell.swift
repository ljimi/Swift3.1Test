//
//  Scroll_Cell.swift
//  swiftTest
//
//  Created by Mac on 17/4/15.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

protocol Scroll_CellDeletate: NSObjectProtocol{
    
    func Scroll_CellDeletateButtonClick(index:NSInteger)
}


class Scroll_Cell: UITableViewCell {

    weak var delegate: Scroll_CellDeletate?
    
    private lazy var scroll:UIScrollView = {
        
        let scroll = UIScrollView()
        
        return scroll
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
        self.contentView.addSubview(scroll)
        
        scroll.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self.contentView)
            make.height.equalTo(190)
        }
        
        let (W,H,jx) = (80,80,10)
        
        for i in 0...8 {
    
            let (hang,lie) = (i / 5,i % 5)
            let (x,y) = (lie * (W + jx),hang * (H + jx))
            
            let btn = UIButton(frame:CGRect(x:x+jx,y:y+jx,width:W,height:H))
    
            btn.tag = i
            btn.setImage(UIImage(named:"-e-"+String(i)), for: .normal)
            if i == 8 {
                btn.setTitle("更多", for: .normal)
                btn.setTitleColor(.black, for: .normal)
            }
            btn.addTarget(self, action:#selector(goto), for: .touchUpInside)
            scroll.addSubview(btn)
            
        }
        
        scroll.contentSize = CGSize(width:80*5+60,height:190)
    }
    
    func goto(sender:UIButton){
        
        //if self.delegate!.responds(to:Selector(("Scroll_CellDeletateButtonClick"))){
            self.delegate!.Scroll_CellDeletateButtonClick(index:sender.tag)
       // }
    }

}
