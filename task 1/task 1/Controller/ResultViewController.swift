//
//  ResultViewController.swift
//  task 1
//
//  Created by DASARLA SNEHA on 29/03/23.
//

import UIKit

class ResultViewController: UIViewController,UITextFieldDelegate {
    
    
        
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passoutYear: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var dateAndTime: UITextField!
    
    @IBOutlet weak var male: UIButton!
    
    @IBOutlet weak var female: UIButton!
    
    @IBOutlet var allStars: [UIButton]!
    
    @IBOutlet var allCircles: [UIButton]!
    
    
    @IBOutlet weak var submitSelected: UIButton!
    
    @IBAction func dobcalen(_ sender: UIButton) {
        
        let picker : UIDatePicker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(dueDateChanged(picker:)), for: UIControl.Event.valueChanged)
        
        picker.frame.size = CGSize(width: 0, height: 200)
        self.view.addSubview(picker)

        dob.inputView = picker
        dob.text = formateDate(date: picker.date)
        
    }
    
    
    @objc func dueDateChanged(picker: UIDatePicker){
        dob.text = formateDate(date: picker.date)
        
    }
    func formateDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    @IBAction func dateandTimecalen(_ sender: UIButton) {
        
        let picker2 : UIDatePicker = UIDatePicker()
        picker2.datePickerMode = .dateAndTime
        picker2.addTarget(self, action: #selector(dueDateChanged2(picker2:)), for: UIControl.Event.valueChanged)
        picker2.frame.size = CGSize(width: 0, height: 200)
        self.view.addSubview(picker2)
        dateAndTime.inputView = picker2
        dateAndTime.text = formateDate2(date: picker2.date)
        
        
    }
    @objc func dueDateChanged2(picker2: UIDatePicker){
        dateAndTime.text = formateDate2(date: picker2.date)
        
    }
    func formateDate2(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy | hh:mm"
        return formatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.delegate = self
        passoutYear.delegate = self
        
        submitSelected.layer.cornerRadius = 15
        submitSelected.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
        
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messagetoDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messagetoDisplay, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped");
                    
                }
                
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func MaleSelection(_ sender: UIButton) {
                self.male.backgroundColor = UIColor.systemCyan
        male.setTitleColor(.white, for: .normal)
        self.female.backgroundColor = UIColor.lightGray
                }
            
    
    @IBAction func FemaleSelection(_ sender: UIButton) {
        self.female.backgroundColor = UIColor.systemCyan
        female.setTitleColor(.white, for: .normal)
        self.male.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func starButton(_ sender: UIButton) {
        
        for button in allStars{
            if button.tag <= sender.tag{
                button.setImage(UIImage(named: "star-symbol-icon"), for: .normal)
            }
            else{
                button.setImage(UIImage(named: "star-half-yellow-icon"), for: .normal)
            }
        }
    }
    
    @IBAction func circleButton(_ sender: UIButton) {
        for button in allCircles{
            if button.tag <= sender.tag{
                button.setImage(UIImage(named: "Component 68 – 82"), for: .normal)
            }
            else{
                button.setImage(UIImage(named: "Component 68 – 87"), for: .normal)
            }
        }
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitSelected(_ sender : UIButton)
    {
        guard let providedEmailAddress = email.text else { return  }
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress)
        if isEmailAddressValid{
            print("Email address is valid")
        }
        else{
            print("Email adress is not valid")
            displayAlertMessage(messagetoDisplay: "Email adress is not valid ")
        }
        self.dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     }
    */

}
