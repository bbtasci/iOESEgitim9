//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 17.12.2020.
//

import UIKit
import Toast

class HomeVC: UIViewController, AddWorkerVCDelegate {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    @IBOutlet weak var addWorkerButton: UIButton!
    @IBOutlet weak var workerListButton: UIButton!

    @IBOutlet weak var compNameLabel: UILabel!
    @IBOutlet weak var numberOfWorkerLabel: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!

    @IBOutlet weak var enterpriceTF: UITextField!
    
    // MARK: - PROPERTIES
    
    let company1 = CompanyBuilder()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // paySalary button view change
        paySalaryButton.layer.cornerRadius = 10
        paySalaryButton.layer.masksToBounds = true
        
        // addIncome button view change
        addIncomeButton.layer.cornerRadius = 10
        addIncomeButton.layer.masksToBounds = true
        
        // addOutcome button view change
        addOutcomeButton.layer.cornerRadius = 10
        addOutcomeButton.layer.masksToBounds = true
        
        // compNameLabel view change
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.masksToBounds = true
        
        // numberOfWorkerLabel view change
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.masksToBounds = true
        numberOfWorkerLabel.text = "Number of workers:" + String(company1.getCompanyNew().countWorkers())
        
        // companyBudgetLabel view change
        companyBudgetLabel.layer.cornerRadius = 10
        companyBudgetLabel.layer.masksToBounds = true
        
        // addNewWorker button view change
        addWorkerButton.layer.cornerRadius = 10
        addWorkerButton.layer.masksToBounds = true
        
        //workerList button view change
        workerListButton.layer.cornerRadius = 10
        workerListButton.layer.masksToBounds = true
    }
    
    // MARK: - ACTIONS
    
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
            company1.getCompanyNew().paySalaries()
            companyBudgetLabel.text = "Budget :" + String (company1.getCompanyNew().getBudget())
        }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        if let income = Int(enterpriceTF.text ?? "") {
            company1.getCompanyNew().increaseBudget(income: income)
            companyBudgetLabel.text = "Budget :" + String (company1.getCompanyNew().getBudget())
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        if let outcome = Int(enterpriceTF.text ?? "")  {
            company1.getCompanyNew().decreaseBudget(outcome : outcome)
            companyBudgetLabel.text = "Budget : " + String(company1.getCompanyNew().getBudget())
            self.view.makeToast("Outcome is added", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addWorkerButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addWorkerVC = storyboard.instantiateViewController(identifier: "AddWorkerVC") as! AddWorkerVC
        addWorkerVC.delegate = self
        self.navigationController?.pushViewController(addWorkerVC, animated: true)
    }
    
    @IBAction func workerListButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let workerListVC = storyboard.instantiateViewController(identifier: "WorkerListVC") as! WorkerListVC
        workerListVC.workers =  company1.getCompanyNew().getWorkerArray()
        self.navigationController?.pushViewController(workerListVC, animated: true)
    }
    
    // MARK: - METHODS
    
    func appendNewEmployee(newEmployee: EmployeeP) {
        company1.getCompanyNew().addNewEmployee(newEmployee: newEmployee)
        numberOfWorkerLabel.text = "Number of workers: " + String(company1.getCompanyNew().countWorkers())
    }
    
}
