
import Foundation
import ILLoginKit
import Alamofire

class LoginCoordinator: ILLoginKit.LoginCoordinator {
    
    
    // reference to ViewController [ used for performsegui calls ]
    let viewController:ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ViewController") as! ViewController

    
    override func start(animated: Bool = true) {
		configureAppearance() // Configure before calling super
        super.start(animated: animated)
    }

    override func finish(animated: Bool = true) {
        super.finish(animated: animated)
    }

    func configureAppearance() {
		configuration = DefaultConfiguration(backgroundImage: #imageLiteral(resourceName: "Background"),
											 tintColor: UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1),
											 errorTintColor: UIColor(red: 253.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 1),
											 signupButtonText: "Create Account",
											 loginButtonText: "Sign In",
											 facebookButtonText: "Login with Facebook",
											 forgotPasswordButtonText: "Forgot password?",
											 recoverPasswordButtonText: "Recover",
											 emailPlaceholder: "E-Mail",
											 passwordPlaceholder: "Password!",
											 repeatPasswordPlaceholder: "Confirm password!",
											 namePlaceholder: "Name",
											 shouldShowSignupButton: true,
											 shouldShowLoginButton: true,
											 shouldShowFacebookButton: true,
											 shouldShowForgotPassword: true)
    }
    

    override func login(email: String, password: String) {
        
        print("from login")
        
        let parameters: Parameters=[
            "email":email,
            "password":password]
        
        //
        Alamofire.request("http://localhost:8888/authSample/login.php", method: .get, parameters: parameters).responseJSON
            {
                
                response  in
                
                if let error = response.result.error as? AFError {
                    if case .responseValidationFailed(.unacceptableStatusCode(let code)) = error {
                        print("ERROR:\(code)")
                    }
                }
                
                let status = response.response?.statusCode
                print("STATUS \(status)")
                
                if let result = response.result.value
                {
                    let jsonData = result as! NSDictionary
                    let val = jsonData.value(forKey: "value") as! Int64
                    print("VALUE:\(val)")
                    
                    if(val==0){
                        print("fail")
                        //self.didSelectSignup(self.viewController, email:email, name:"", password:password)
                    }
                    else if(val==1){
                        print("succes")
                        /*let alert = UIAlertController(title: "Registered !", message: "You havee been successfully registered!", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alert.addAction(UIAlertAction(title: "Take me to login", style: UIAlertActionStyle.cancel) {
                            UIAlertAction in
                            super.didSelectLogin(self.visibleViewController()!, email: "", password: "")
                            // self.signupDidSelectBack(self.viewController)
                        })
                        self.visibleViewController()!.present(alert, animated: true, completion: nil)*/
                    }
                }
        }
        
      /*  guard let url = URL(string: "http://localhost:8888/authSample/login.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if let data = data {
                do {
                    print("RES RES \(data)")
                    let jsonDict:NSDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
                    print("JSON RES \(jsonDict)")
                
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
            }.resume()*/
        
    }

    override func signup(name: String, email: String, password: String){

        let parameters: Parameters=[
           "email":email,
           "password":password,
           "username":name]
        
        Alamofire.request("http://localhost:8888/authSample/register.php", method: .get, parameters: parameters).responseJSON
            {
                response  in
                if let result = response.result.value
                {
                    
                    let jsonData = result as! NSDictionary
                    let val = jsonData.value(forKey: "value") as! Int64
                    print("VALUE:\(val)")
                    
                    if(val==0){
                        print("fail")
                        self.didSelectSignup(self.viewController, email:email, name:name, password:password)
                    }
                    else if(val==1){
                        print("succes")
                        let alert = UIAlertController(title: "Registered !", message: "You havee been successfully registered!", preferredStyle: UIAlertControllerStyle.alert)
                       
                        alert.addAction(UIAlertAction(title: "Take me to login", style: UIAlertActionStyle.cancel) {
                            UIAlertAction in
                           // super.didSelectLogin(self.visibleViewController()!, email: "", password: "")
                           self.signupDidSelectBack(self.viewController)
                        })
                        self.visibleViewController()!.present(alert, animated: true, completion: nil)
                    }
                   
                }
               
        }
        
        
    }

    override func enterWithFacebook(profile: FacebookProfile) {
        // WILL BE FINISHED NEXT TUTORIAL
        print("Login/Signup via Facebook")

    }

    override func recoverPassword(email: String) {
        // Handle password recovery via your API
        print("Recover password with: email ")
    }

}

enum Settings {
	static let defaultLoginConfig = DefaultConfiguration(backgroundImage: #imageLiteral(resourceName: "Background"),
														tintColor: UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1),
														 errorTintColor: UIColor(red: 253.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 1),
														 signupButtonText: "Create Account",
														 loginButtonText: "Sign In",
														 facebookButtonText: "Login with Facebook",
														 forgotPasswordButtonText: "Forgot password?",
														 recoverPasswordButtonText: "Recover",
														 emailPlaceholder: "E-Mail",
														 passwordPlaceholder: "Password!",
														 repeatPasswordPlaceholder: "Confirm password!",
														 namePlaceholder: "Name",
														 shouldShowSignupButton: true,
														 shouldShowLoginButton: true,
														 shouldShowFacebookButton: true,
														 shouldShowForgotPassword: true)

}
