//
//  LeftMenuViewController.swift
//  demoApp
//
//  Created by tuannv on 12/28/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit
enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case go
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}


class LeftMenuViewController: UIViewController {
    let backgroundColor = UIColor(hex: "F1F8E9")
    
    @IBOutlet weak var tableView: UITableView!
    
    var menus = ["New Account Create", "Wallet Create", "My Profile", "Internal Money Transfer", "Support", "Logout"]
    
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    var javaViewController: UIViewController!
    var goViewController: UIViewController!
    var nonMenuViewController: UIViewController!
    var imageHeaderView: ImageHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        
        let swiftViewController = storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
        
        let javaViewController = storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let goViewController = storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        self.goViewController = UINavigationController(rootViewController: goViewController)
        
//        let nonMenuController = storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
//        nonMenuController.delegate = self
//
//        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
        
        self.tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.identifier)
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
//        tableView.reloadData()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = backgroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .swift:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        case .java:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .go:
            self.slideMenuController()?.changeMainViewController(self.goViewController, close: true)
        case .nonMenu:
            self.slideMenuController()?.changeMainViewController(self.nonMenuViewController, close: true)
        }
    }
}

extension LeftMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .swift, .java, .go, .nonMenu:
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftMenuViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .swift, .java, .go, .nonMenu:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                let leftMenuItem = LeftMenuModal(name: self.menus[indexPath.row], icon: "icon_shield")
                cell.setData(leftMenuItem)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}
