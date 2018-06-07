# iOS: user management in Swift 

This repo is associated to an [iOS tutorial](https://pragmatictheories.tech/ios-user-registration-with-php-mysql-and-loginkit-ui) I am currently sharing.
It helps you implement user management in Swift with Alamofire and PHP/MySQL and includes a Facebook registration module.

## Description

This repo and [the associated tutorial](https://pragmatictheories.tech/ios-user-registration-with-php-mysql-and-loginkit-ui
) demos the following:

* ### Use of [LoginKit](https://github.com/IcaliaLabs/LoginKit) for Login/Signup UX
LoginKit takes care of the UI, the forms, the data validation, and Facebook SDK access. All we need to add is the necessary calls to our own backend API to login or signup.


<p align="center">
<img src="https://raw.githubusercontent.com/AmalH/User-registration-with-alamofire_mysql-and-facebook_sdk/master/screenshots/iloginkit1.png"/>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/AmalH/User-registration-with-alamofire_mysql-and-facebook_sdk/master/screenshots/iloginkit3.png"/>
</p>

* ### Use of Alamofire to consume PHP/MYSQL backend for user registration
A very simple php backend for signup/login to a MySQL database is consumed through the [Alamofire HTTP networking library](https://github.com/Alamofire/Alamofire):

```javascript
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
```

<p align="center">
<img src="https://raw.githubusercontent.com/AmalH/User-registration-with-alamofire_mysql-and-facebook_sdk/master/screenshots/mysql1.png"/>
</p>

* ### Facebook SDK for Swift integration
Easy and clear implementation of Facebook SDK for Swift.


## Getting started
Clone this repository and import into Xcode
```javascript
git clone https://github.com/AmalH/User-registration-with-alamofire_mysql-and-facebook_sdk.git
```
