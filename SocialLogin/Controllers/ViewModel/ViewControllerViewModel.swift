//
//  ViewControllerViewModel.swift
//  SocialLogin
//
//  Created by Amrut Waghmare on 28/11/19.
//  Copyright © 2019 Amrut Waghmare. All rights reserved.
//

import UIKit

class ViewControllerViewModel: NSObject {
    lazy var googleLoginViewModel: GoogleLoginViewModel = {
        let obj = GoogleLoginViewModel()
        return obj
    }()
    
    lazy var facebookLoginViewModel: FacebookLoginViewModel = {
           let obj = FacebookLoginViewModel()
           return obj
       }()
    
    required override init() {
        super.init()
    }

    func loginWithFacebook(target: UIViewController){
          facebookLoginViewModel.loginWithFacebook(target: target) { (userData, error) in
            if error == nil{
                print(userData)
              } else {
                  print(error?.localizedDescription ?? "")
              }
          }
      }
      
      func loginWithGmail(target: UIViewController){
          googleLoginViewModel.loginWithGmail(target: target) { (userData, error) in
              if error == nil {
                    print(userData)
              } else {
                  print(error?.localizedDescription ?? "")
              }
          }
      }
}
