//
//  MainTabbar.swift
//  ToDoList
//
//  Created by ericzero on 6/26/22.
//

import UIKit

class MainTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        self.navigationItem.hidesBackButton = true
    
    }
        func setTabbar(){
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        home.tabBarItem.image = UIImage(named: "home2")
        home.tabBarItem.title = "Home"
            
        let add = AddVC(nibName: "AddVC", bundle: nil)
        //add.tabBarItem.image = UIImage(named: "plus")
        
        let list = ListVC(nibName: "ListVC", bundle: nil)
        list.tabBarItem.image = UIImage(named: "grid2")
        list.tabBarItem.title = "Task"
        
        let vc = [home, add, list]
        viewControllers = vc
            
            
        let btn = UIButton(frame: CGRect(x: 155, y: -22, width: 80, height: 80))

            btn.layer.cornerRadius = 28
            self.tabBar.addSubview(btn)
            btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
            
            btn.setImage(UIImage(named: "plus"), for: .normal)

    }
    
    @objc func btnClicked(){
        let add = AddVC(nibName: "AddVC", bundle: nil)
        add.modalPresentationStyle = .overFullScreen
        self.present(add, animated: true)
    }
}

