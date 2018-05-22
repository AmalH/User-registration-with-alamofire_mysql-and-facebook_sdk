
import Foundation
import ILLoginKit
import Alamofire

class LoginCoordinator: ILLoginKit.LoginCoordinator {
    
    // api calls
    let signUp_apiurl = Session.Local+"/booklog/register.php"
    let login_apiurl = Session.Local+"/booklog/login.php"
    
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
            "password":password,
            ]
        
       /* Alamofire.request(login_apiurl, method: .get, parameters: parameters).response
            {
                response  in
                print("JSON:\(response)")
                // getting the json value from the serverllo
                if let result = response
                {
                    let jsonData = result as! NSDictionary
                    print(jsonData)
                    
                    let val = jsonData.value(forKey: "value") as! Int64
                    print(val)
                    
                    if(val==0){
                        print("fail")
                        //self.finish()
                    }
                    else if(val==1){
                        print("succes")
                        let alertController = UIAlertController(title: "Welcome to BooklOg", message: "you were successfully registered", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "Go to login", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        //self.didSelectLogin(self.viewController, email: email, password:password)
                    }
                    
                }
                self.finish()
                }*/
        //self.viewController.performSegue(withIdentifier: "navigateToHome", sender: nil)
		//finish()
    }

    override func signup(name: String, email: String, password: String){
        
        print("from signup")
        
        guard let url = URL(string: signUp_apiurl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if let data = data {
                do {
                    print("RES RES \(data)")
                  /*  let json = try JSON(data: data)
                    print("RES RES \(json)")
                    let list: Array<JSON> = json["books"].arrayValue
                    let name = ((list[0])["isbn13"]).stringValue
                    // Getting a string from a JSON Dictionary
                    print("TEST TEST \(name)")*/
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
            }.resume()
       /* let parameters: Parameters=[
            "email":email,
           "password":password,
           "username":name
           ]
        
        Alamofire.request(signUp_apiurl, method: .get, parameters: parameters).responseJSON
            {
                response  in
                print("JSON:\(response.result.value)")
                // getting the json value from the serverllo
                if let result = response.result.value
                {
                    let jsonData = result as! NSDictionary
                    print(jsonData)
                    
                    let val = jsonData.value(forKey: "value") as! Int64
                    print(val)
                    
                    if(val==0){
                        print("fail")
                        self.didSelectSignup(self.viewController, email:email, name:name, password:password)
                        //self.finish()
                    }
                    else if(val==1){
                        print("succes")
                        let alertController = UIAlertController(title: "Welcome to BooklOg", message: "you were successfully registered", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "Go to login", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.didSelectLogin(self.viewController, email: email, password:password)
                    }
                   
                }
                self.finish()
        }*/
        
        
    }

    override func enterWithFacebook(profile: FacebookProfile) {
        // Handle Facebook login/signup via your API
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
