//
//  HomeViewController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

let contentSize = SCREENWIDTH * 5.0

class HomeViewController: BaseViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    private lazy var searchBar:UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "搜索你想要的商品"
        searchBar.showsCancelButton = false
        searchBar.showsScopeBar = false
      
        
        let btn = UIButton(type:.custom)
        btn.frame = searchBar.frame
        btn.addTarget(self, action:#selector(search), for:.touchUpInside)
        searchBar.addSubview(btn)
        
        return searchBar
    }()
    
    private lazy var collection:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:(SCREENWIDTH-30)/2,height:(SCREENWIDTH-30)/2)
        let collection = UICollectionView(frame: CGRect(x:0, y:0, width:SCREENWIDTH, height:SCREENHEIGHT), collectionViewLayout: layout)
   
        collection.register(Home_Cell.self, forCellWithReuseIdentifier:"cell")
        
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        setUI()
    }

    
    private func setNav(){
        
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(target:self,action:#selector(cart),imgName:"tabbar_shopCart_sel",HimgName:"tabbar_shopCart_unsel")
    
    }
    
    private func setUI(){
        
        self.view.addSubview(collection)
     
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! Home_Cell
       
      
        cell.layer.borderWidth = 0.3;
     
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var offset:CGFloat = CGFloat()
        offset = scrollView.contentOffset.y
        
        if offset <= 64 {
            
            self.navigationController?.navigationBar.alpha = 0;
            
        }else
        {
            self.navigationController?.navigationBar.alpha = offset/400;
        }
        
        
    }
    
    @objc private func search(){
        
        
     
        print("ssssssssssssssssss")
        
        
    }
    
    @objc private func cart(){
        
       
        print("cartcartcartcartcartcart")
        
        
    }
    
    
    
    
    
    
    
    

}
