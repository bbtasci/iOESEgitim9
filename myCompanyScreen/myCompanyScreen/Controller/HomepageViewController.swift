//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 17.12.2020.
//

import UIKit
import Toast

class HomepageViewController: UIViewController, AddEmployeeViewControllerDelegate {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    @IBOutlet weak var addNewEmployeeButton: UIButton!
    @IBOutlet weak var employeeListButton: UIButton!

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var numberOfEmployeesButton: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!

    @IBOutlet weak var enterPriceTextField: UITextField!
    
    // MARK: - PROPERTIES
    
    let company1 = CompanyBuilder()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    fileprivate func prepareUI() {
        prepareAllLayers()
    }
    
    fileprivate func prepareAllLayers() {
        prepareLayers(object: companyNameLabel as Any)
        prepareLayers(object: numberOfEmployeesButton as Any)
        numberOfEmployeesButton.text = "Number of employees: \(String(company1.getCompanyNew().countWorkers()))"
        prepareLayers(object: companyBudgetLabel as Any)
        companyBudgetLabel.text = "Budget: $\(String(company1.getCompanyNew().getBudget()))"
        prepareLayers(object: paySalaryButton as Any)
        prepareLayers(object: addIncomeButton as Any)
        prepareLayers(object: addOutcomeButton as Any)
        
        
        prepareLayers(object: addNewEmployeeButton as Any)
        prepareLayers(object: employeeListButton as Any)
        prepareLayers(object: enterPriceTextField as Any)
    }
    
    fileprivate func prepareLayers(object: Any) {
        if let object = object as? UIButton {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UILabel {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UITextField {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
            company1.getCompanyNew().paySalaries()
            companyBudgetLabel.text = "Budget: $\(String(company1.getCompanyNew().getBudget()))"
        }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        if let income = Int(enterPriceTextField.text ?? "") {
            company1.getCompanyNew().increaseBudget(income: income)
            companyBudgetLabel.text = "Budget: $\(String(company1.getCompanyNew().getBudget()))"
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        if let outcome = Int(enterPriceTextField.text ?? "")  {
            company1.getCompanyNew().decreaseBudget(outcome : outcome)
            companyBudgetLabel.text = "Budget: $\(String(company1.getCompanyNew().getBudget()))"
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addNewEmployeeButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addEmployeeViewController = storyboard.instantiateViewController(identifier: "AddEmployeeViewController") as! AddEmployeeViewController
        addEmployeeViewController.delegate = self
        self.navigationController?.pushViewController(addEmployeeViewController, animated: true)
    }
    
    @IBAction func employeeListButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let companyDetailsViewController = storyboard.instantiateViewController(identifier: "CompanyDetailsViewController") as! CompanyDetailsViewController
        companyDetailsViewController.employees =  company1.getCompanyNew().getWorkerArray()
        self.navigationController?.pushViewController(companyDetailsViewController, animated: true)
    }
    
    // MARK: - METHODS
    
    func appendNewEmployee(newEmployee: EmployeeP) {
        company1.getCompanyNew().addNewEmployee(newEmployee: newEmployee)
        numberOfEmployeesButton.text = "Number of employees: " + String(company1.getCompanyNew().countWorkers())
    }
}
