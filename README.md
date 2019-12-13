# SocialLogin

Steps to integrate

use following pod
pod 'GoogleSignIn'
pod 'FBSDKLoginKit'
pod 'FacebookCore'
pod 'FacebookLogin'

login with google 
Set API Key in app delegate
and add url schema with google key


login with Facebook
setup info plist file with key values provided by Facebook
set url schema with Facebook key

add following code in app delegate 
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
let appId: String = "Facebook key"
if url.scheme != nil && url.scheme!.hasPrefix("fb\(appId)") && url.host == "authorize" {
return ApplicationDelegate.shared.application(app, open: url, options: options)
}
return GIDSignIn.sharedInstance().handle(url)
}


How to use
create object of login with Facebook or login with gmail view model and call login method by providing a target view controller 
After completion it will send callback with data and error


lazy var googleLoginViewModel: GoogleLoginViewModel = {
let obj = GoogleLoginViewModel()
return obj
}()

lazy var facebookLoginViewModel: FacebookLoginViewModel = {
let obj = FacebookLoginViewModel()
return obj
}()
