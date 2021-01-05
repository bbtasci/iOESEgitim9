//
//  SecondViewController.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 18.12.2020.
//

import UIKit

protocol AddEmployeeViewControllerDelegate: class {
    func appendNewEmployee(newEmployee: EmployeeP)
}

class AddEmployeeViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var jobPositionTextField: UITextField!
    @IBOutlet weak var addNewEmployeeButton: UIButton!
    
    // MARK: - PROPERTIES
    
    weak var delegate : AddEmployeeViewControllerDelegate?
    let jobPositions = ["Assistant", "Director"]
    var pickerViewJobPosition = UIPickerView()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePickerView()
        prepareUI()
    }
    
    fileprivate func preparePickerView() {
        pickerViewJobPosition.delegate = self
        pickerViewJobPosition.dataSource = self
        jobPositionTextField.inputView = pickerViewJobPosition
    }
    
    fileprivate func prepareUI() {
        prepareAllLayers()
    }
    
    fileprivate func prepareAllLayers() {
        prepareLayers(object: titleLabel as Any)
        prepareLayers(object: nameTextField as Any)
        prepareLayers(object: ageTextField as Any)
        prepareLayers(object: jobPositionTextField as Any)
        prepareLayers(object: addNewEmployeeButton as Any)
       
    }
    
    fileprivate func prepareLayers(object: Any) {
        if let object = object as? UIButton {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UITextField {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
            object.layer.borderWidth = 1
            object.layer.borderColor = UIColor.blue.cgColor
        } else if let object = object as? UILabel {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addNewEmployeeButtonTouched(_ sender: Any) {
        if nameTextField.text != "" && ageTextField.text != "" && jobPositionTextField.text != "" {
            
            var newEmployee = EmployeeP()
            
            if jobPositionTextField.text == "Director"{
                newEmployee = Director()
                newEmployee.age = Int(ageTextField.text ?? "0") ?? 0
                newEmployee.name = nameTextField.text ?? ""
                
                self.view.makeToast("New employee is added!", duration: 2.0, position: .center)
            } else if jobPositionTextField.text == "Assistant" {
                
                newEmployee = Assistant()
                newEmployee.age = Int(ageTextField.text ?? "0") ?? 0
                newEmployee.name = nameTextField.text ?? ""
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

// MARK: - UIPickerView Delegate and Data Source Methods

extension AddEmployeeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobPositions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jobPositions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        jobPositionTextField.text = jobPositions[row]
    }
}
