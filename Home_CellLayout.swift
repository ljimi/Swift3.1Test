//
//  Home_CellLayout.swift
//  swiftTest
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class Home_CellLayout: UICollectionViewFlowLayout {
    
    private lazy var attrsArray:NSMutableArray = {
        let attrsArray = NSMutableArray()
        
        return attrsArray
        
    }()
    
    private lazy var h:CGFloat = {
        
        let h = CGFloat()
        return h
        
    }()
    
    override func prepare() {
        super.prepare()
        attrsArray.removeAllObjects()
        
        var count = NSInteger()
        count = (self.collectionView?.numberOfItems(inSection: 0))!
        
        var i:NSInteger = NSInteger()
      
       
        
        for i  in 0...count {
            
            var indexPath = NSIndexPath(item:i,section:0)
           
            var attrs = UICollectionViewLayoutAttributes()
            attrs = self.layoutAttributesForItem(at: indexPath as IndexPath)!
        
            
            // 设置布局属性
            var _width:CGFloat = 175
            var _height:CGFloat = 152.5
            var _jx:CGFloat = SCREENWIDTH - 175*2/5;
            var _x,_y:CGFloat
            
            if i%2 == 0 && i != 0{
                _x = _width + _jx * 3
                _y = 225 + ((i-1)/2)*(_height + _jx) + 10
            }else{
                _x = _jx * 2;
                _y = 225 + ((i-1)/2)*(_height + _jx) + 10
            }
            
            
            if i == 0 {
                
                attrs.frame = CGRect(x:0, y:0, width:SCREENWIDTH, height:225)
            } else{
                
                attrs.frame = CGRect(x:_x, y:_y, width:_width, height:_height)
            }
            
            attrsArray.add
            
            h = 225 + ((count-1)/2)*(_height + _jx) + 10
            
        }
        
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return attrsArray
    
    }
    
    override var collectionViewContentSize: CGSize{
        
        return CGSize(width:SCREENWIDTH, height:h + 100)
        
    }
    
}
