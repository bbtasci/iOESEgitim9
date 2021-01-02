//
//  SecondViewController.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 18.12.2020.
//

import UIKit

protocol AddWorkerVCDelegate: class {
    func appendNewEmployee(newEmployee: EmployeeP)
}

class AddWorkerVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAgeTF: UITextField!
    @IBOutlet weak var enterJobPositionTF: UITextField!
    @IBOutlet weak var addWorkerButton2: UIButton!
    
    // MARK: - PROPERTIES
    
    weak var delegate : AddWorkerVCDelegate?
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // enterName text field view change
        enterNameTF.layer.borderColor = UIColor.blue.cgColor
        enterNameTF.layer.borderWidth = 1
        enterNameTF.layer.cornerRadius = 10
        enterNameTF.layer.masksToBounds = true
        
        // enterAge text field view change
        enterAgeTF.layer.borderColor = UIColor.blue.cgColor
        enterAgeTF.layer.borderWidth = 1
        enterAgeTF.layer.cornerRadius = 10
        enterAgeTF.layer.masksToBounds = true
        
        // enterJobPosition text field view change
        enterJobPositionTF.layer.borderColor = UIColor.blue.cgColor
        enterJobPositionTF.layer.borderWidth = 1
        enterJobPositionTF.layer.cornerRadius = 10
        enterJobPositionTF.layer.masksToBounds = true
        
        // addNewWorker button view change
        addWorkerButton2.layer.cornerRadius = 10
        addWorkerButton2.layer.masksToBounds = true
        addWorkerButton2.layer.borderColor = UIColor.blue.cgColor
        addWorkerButton2.layer.borderWidth = 1
    }
    
    // MARK: - ACTIONS
    
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addWorkerButtonPressed2(_ sender: Any) {
        if enterNameTF.text != "" && enterAgeTF.text != "" && enterJobPositionTF.text != "" {
            
            var newEmployee = EmployeeP()
            
            if enterJobPositionTF.text == "Director"{
                newEmployee = Director()
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                newEmployee.name = enterNameTF.text ?? ""
                
                self.view.makeToast("New employee is added!", duration: 2.0, position: .center)
            } else if enterJobPositionTF.text == "Assistant" {
                
                newEmployee = Assistant()
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                newEmployee.name = enterNameTF.text ?? ""
                self.view.makeToast("New employee is added!", duration: 2.0, position: .center)
            } else {
                self.view.makeToast("Please fill the Job Position Area with 'Assistant' or 'Director'", duration: 2.5, position: .center)
                return
            }
            self.delegate?.appendNewEmployee(newEmployee: newEmployee)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.view.makeToast("Please fill all the fields!", duration: 2.5, position: .center)
        }
    }
}

