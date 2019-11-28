//
//  FacebookLogin.swift
//  Salon
//
//  Created by Amrut Waghmare on 26/11/19.
//  Copyright © 2019 Amrut Waghmare. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookLoginViewModel: NSObject {

    typealias typeCompletionHandler = ([String:Any]?, Error?) -> ()
    lazy var okCompletion : typeCompletionHandler = {_ , _ in}
    
    required override init() {
        super.init()
    }
    
    //TODO:- Login using custom button
    func loginWithFacebook(target: UIViewController,_ loginCompletionHandler: @escaping typeCompletionHandler){
        self.okCompletion = loginCompletionHandler
        self.openFBController(target: target)
    }
    
    func openFBController(target: UIViewController){
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: target) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil), let dictResponse = result as? Dictionary<String,Any>{
                    //everything works print the user data
                    print(dictResponse)
//
                    self.okCompletion(dictResponse,nil)
                } else {
                    self.okCompletion(nil,error)
                }
            })
        }
    }
}
