import UIKit
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var SignUp_Cartype_TextField: UITextField!
    @IBOutlet weak var SignUp_Name_TextField: UITextField!
    @IBOutlet weak var SignUp_Email_TextField: UITextField!
    @IBOutlet weak var SignUp_Password_TextField: UITextField!
    @IBOutlet weak var SignUp_Password_again_TextField: UITextField!

    
    var SignUp_Cartype = ""
    var SignUp_Name = ""
    var SignUp_Email = ""
    var SignUp_Password = ""
    var SignUp_Password_again = ""
    var loginAttempted = false
    var login_option = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func GoTo_PostLogin(_ sender: UIButton) {
        if let email = SignUp_Email_TextField.text, let password = SignUp_Password_TextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }
                if self.SignUp_Cartype_TextField.text!.isEmpty{
                    print("Please enter your cartype")
                }
                else {
                    // Navigate to the chatViewController
                    print("Success")
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
            
        }
        
        self.SignUp_Cartype = SignUp_Cartype_TextField.text!
        self.SignUp_Name = SignUp_Name_TextField.text!
        self.SignUp_Email = SignUp_Email_TextField.text!
        self.SignUp_Password = SignUp_Password_TextField.text!
        self.SignUp_Password_again = SignUp_Password_again_TextField.text!
        
//        check if Passwords are matching
        if SignUp_Password_TextField.text == SignUp_Password_again_TextField.text! {
            print("correct")
            loginAttempted = true
        }else{
            print("false")
        }
        
        
//        another Option would be  ||
        if SignUp_Cartype_TextField.text!.isEmpty {
            print("Please enter your cartype")
        }
        
        if SignUp_Email_TextField.text!.isEmpty {
                print("Please enter your EMail")
        }
        
        if SignUp_Cartype_TextField.text!.isEmpty {
            print("please enter your cartype")
        }
        
        if SignUp_Name_TextField.text!.isEmpty {
            print("please enter your name")
        }
        
        if SignUp_Password_TextField.text!.isEmpty {
            print("please enter a password")
        }
        
        if SignUp_Password_again_TextField.text!.isEmpty {
            print("please reenter your password")
        }
        
        login_option = "SignUp"
    }
    
//    Passing variables from one ViewController to the next with this function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! PostLoginViewController
        destVC.Display_SignUp_Cartype = self.SignUp_Cartype
        destVC.Display_Login_Name = self.SignUp_Name
        destVC.Display_SignUp_EMail = self.SignUp_Email
        destVC.Display_SignUp_Password = self.SignUp_Password
        destVC.login_option = self.login_option
    }
    
//      dismiss the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SignUp_Cartype_TextField.resignFirstResponder()
    }
}
