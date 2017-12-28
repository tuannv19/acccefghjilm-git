//
//  LoginViewController.swift
//  demoApp
//
//  Created by tuannv on 12/28/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class LoginViewController: UIViewController {

    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var lblSign: UILabel!
    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var lblRetrive: UILabel!
    @IBOutlet weak var txtPassword: NVTextField!
    @IBOutlet weak var txtUserName: NVTextField!
    @IBOutlet weak var lbPassword: UILabel!
    @IBOutlet weak var lbUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnLoginDidClick(_ sender: Any) {
        let mainViewController  = self.storyboard?.instantiateViewController(withIdentifier: DashBoardViewController.storyBoadIdentifier)
        let leftViewController = storyboard?.instantiateViewController(withIdentifier: LeftMenuViewController.storyBoadIdentifier)
        
        SlideMenuOptions.rightPanFromBezel = false
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController!, leftMenuViewController: leftViewController!, rightMenuViewController: UIViewController())
        let window = UIApplication.shared.windows[0]
        
        window.rootViewController = slideMenuController
        window.makeKeyAndVisible()
        
        
    }
}
