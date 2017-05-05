//
//  MessageViewController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class MessageViewController:BaseViewController,UITableViewDelegate,UITableViewDataSource,Scroll_CellDeletate {

    
    var array:[String] = NSArray() as! [String]
    var detailArray:[String] = NSArray() as! [String]
    
    private lazy var listTableView:UITableView = {
        
        let listTableView = UITableView()
        
        listTableView.frame = CGRect(x:0,y:0,width:SCREENWIDTH,height:SCREENHEIGHT)
        listTableView.separatorStyle = .none
        listTableView.estimatedRowHeight = 150
        listTableView.delegate = self
        listTableView.dataSource = self

        
        return listTableView
    }()
    
    
    private lazy var searchBar:UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "搜索你想要的信息"
        searchBar.showsCancelButton = false
        searchBar.showsScopeBar = false
        
        return searchBar
    }()
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        array = ["","","","牛小牛","舒小书","狗小狗","喵小喵","李孝利","熊小熊","璐小璐","木木","阿尔法","贝塔","伽马"]
        detailArray = ["","","","牛小牛是牛,光干活，不吃饭","舒小书不看书，看电视机","狗小狗从来不叫","喵小喵抓了个小老鼠，当作伙伴一起玩，时间长了被小老鼠管","","熊小熊吃竹子，不是熊猫学🐼","璐小璐变兔子，跳呀跳，跳到外婆桥，遇到大灰狼，快点跑呀跑，跳呀跳，跳到外婆桥，遇到大灰狼，快点跑呀跑","木木不哭","阿尔法突袭","贝塔冲击波","伽马极光"]
        listTableView.tableHeaderView = searchBar
        self.view.addSubview(listTableView)
    }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            
            let cell = Bundle.main.loadNibNamed("Img_Cell", owner: nil, options: nil)?.last
            return cell as! UITableViewCell
            
        }else if indexPath.row == 1 {
            
            let cell = Scroll_Cell(style:.default, reuseIdentifier: "scell")
            cell.delegate = self
            return cell
            
        }else if indexPath.row == 2 {
            
            let cell = Bundle.main.loadNibNamed("Show_Cell", owner: nil, options: nil)?.last
            return cell as! UITableViewCell
            
        }else if indexPath.row == 3 {
            
            let cell = Bundle.main.loadNibNamed("Mumu_Cell", owner: nil, options: nil)?.last
            return cell as! UITableViewCell
            
        }else if indexPath.row == 4 {
            
            let cell = Bundle.main.loadNibNamed("Show_Cell", owner: nil, options: nil)?.last
            return cell as! UITableViewCell
            
        }else if indexPath.row == 5 {
            
            let cell = Bundle.main.loadNibNamed("Show_Cell", owner: nil, options: nil)?.last
            return cell as! UITableViewCell
            
        }else{
            
            let cell = Message_Cell(style:.default, reuseIdentifier: "ccell")
            cell.titleLab.text = array[indexPath.row]
            cell.detailLab.text = detailArray[indexPath.row]
            return cell
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if indexPath.row == 0 {
            
            let act = ActivityViewController()
            self.navigationController?.pushViewController(act, animated: true)
        }
        
        
        
        
        
        
        
    }
    
    func Scroll_CellDeletateButtonClick(index: NSInteger) {
        print("hshshshs",index)
        
        if index == 0 {
            
        }
        
        
        
        
        
    }
    
    @objc private func search(){
        
        print("ssssssssssssssssss")
        
    }
    
    
}
