//
//  ViewController.swift
//  SocialLogin
//
//  Created by Amrut Waghmare on 28/11/19.
//  Copyright © 2019 Amrut Waghmare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var viewModel: ViewControllerViewModel = {
              let obj = ViewControllerViewModel()
              return obj
          }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionLoginWithFacebook(_ sender: UIButton){
        viewModel.loginWithFacebook(target: self)
    }
    
    @IBAction func actionLoginWithGmail(_ sender: UIButton){
        viewModel.loginWithGmail(target: self)
    }

}

