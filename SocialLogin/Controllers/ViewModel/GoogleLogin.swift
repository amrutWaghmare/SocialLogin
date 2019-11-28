//
//  GoogleLogin.swift
//  Salon
//
//  Created by Amrut Waghmare on 20/11/19.
//  Copyright © 2019 Amrut Waghmare. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleLoginViewModel: NSObject {
    
    typealias typeCompletionHandler = ([String:Any]?, Error?) -> ()
    
    lazy var okCompletion : typeCompletionHandler = {_ , _ in}
    
    required override init() {
        super.init()
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    //TODO:--- Add following commented code on App delegate
    // Add API key inside didLaunch of app delegate
//    GIDSignIn.sharedInstance()?.clientID = "API Key"
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//         return GIDSignIn.sharedInstance().handle(url)
//     }
    
    //Add API key into the URL Schema in reverse order
    
    
    //TODO:- Check if user already login with account
    func checkIfUserAlreadyLoggedIn(target: UIViewController,_ loginCompletionHandler: @escaping typeCompletionHandler){
         self.okCompletion = loginCompletionHandler
        GIDSignIn.sharedInstance()?.presentingViewController = target
        
         //                 Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    //TODO:- Login using custom button
    func loginWithGmail(target: UIViewController,_ loginCompletionHandler: @escaping typeCompletionHandler){
        self.okCompletion = loginCompletionHandler
        GIDSignIn.sharedInstance()?.presentingViewController = target
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    //TODO:- Logout function
    func logoutGmail(){
        GIDSignIn.sharedInstance().signOut()
    }
}

//MARK:-- Google Login Delegates
extension GoogleLoginViewModel: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            okCompletion(nil,error)
            return
        }
        
        // Perform any operations on signed in user here.
        var responseDict : [String:Any] = [:]
        responseDict["userID"] = user?.userID
        responseDict["idToken"] = user?.authentication.idToken
        responseDict["name"] = user?.profile.name
        responseDict["givenName"] = user?.profile.givenName
        responseDict["familyName"] = user?.profile.familyName
        responseDict["email"] = user?.profile.email
        responseDict["profileImage"] = user?.profile.imageURL(withDimension: 200)
        print(responseDict)
        
        okCompletion(responseDict,nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
