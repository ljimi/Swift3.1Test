//
//  PersonViewController.swift
//  swiftTest
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 ZC. All rights reserved.
//

import UIKit

class PersonViewController:BaseViewController,UITableViewDelegate,UITableViewDataSource,PerNavViewDeletate{
    
    var array:[String] = NSArray() as! [String]
    
    private lazy var listTableView:UITableView = {
        
        let listTableView = UITableView()
        
        listTableView.frame = CGRect(x:0,y:0,width:SCREENWIDTH,height:SCREENHEIGHT)
        
        listTableView.delegate = self
        listTableView.dataSource = self
        let fview = UIView()
        listTableView.tableFooterView = fview
        
        return listTableView
    }()
    

    private lazy var hview:UIImageView = {
        
        let hview = UIImageView(frame: CGRect(x:0,y:0,width:SCREENWIDTH,height:160))
        hview.image = UIImage(named:"person_bg")
        hview.isUserInteractionEnabled = true
        
        return hview
    }()
    
    private lazy var icon:UIImageView = {
        
        let icon = UIImageView()
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = 40
        icon.image = UIImage(named:"人像bg")
        
        return icon
    }()
    
   private lazy var nameLab:UILabel = {
        
        let nameLab = UILabel()
        nameLab.text = "青衣"
        nameLab.textAlignment = .center
        nameLab.textColor = RGBA(255, 255, 255, 1)
        return nameLab
        
    }()
    
    var nav:PerNavView = {
        let nav = PerNavView()
        return nav
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setTableView()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    private func setTableView(){
        
        array = ["活动预约","消息通知","注意事项","日程","设置","关于我们"]
        
       
        nav.delegate = self
        hview.addSubview(nav)
        hview.addSubview(icon)
        hview.addSubview(nameLab)
        self.view.addSubview(listTableView)
        listTableView.tableHeaderView = hview
        
        nav.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(hview)
            make.bottom.equalTo(icon.snp.top)
        }
        
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(hview)
            make.centerY.equalTo(hview).offset(-10)
            make.width.height.equalTo(80)
        }
        nameLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(hview)
            make.top.equalTo(icon.snp.bottom).offset(10)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    
        cell.accessoryType = .disclosureIndicator;
            
        cell.textLabel?.text = array[indexPath.row]
        
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
            
            if indexPath.row == 0 {
            
             let act = ActivityViewController()
             self.navigationController?.pushViewController(act, animated: true)
            }
            
            
            
            
            
            
            
        }
    
    
    func composeButtonClick() {
        
        let act = ActivityViewController()
        self.navigationController?.pushViewController(act, animated: true)
        
    }
    
  
    
}
