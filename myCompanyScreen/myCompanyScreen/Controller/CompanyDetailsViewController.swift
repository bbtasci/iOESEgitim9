//
//  WorkerListVC.swift
//  myCompanyScreen
//
//  Created by Barış Berkin Taşçı on 27.12.2020.
//

import UIKit

final class CompanyDetailsViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    
    var employees: [EmployeeP] = []
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    fileprivate func prepareUI() {
        prepareAllLayers()
        prepareTableView()
    }
    
    fileprivate func prepareAllLayers() {
        prepareLayers(object: titleLabel as Any)
        prepareLayers(object: employeeNameLabel as Any)
        employeeNameLabel.text = "Name"
        prepareLayers(object: employeeAgeLabel as Any)
        employeeAgeLabel.text = "Age"
        prepareLayers(object: employeeSalaryLabel as Any)
        employeeSalaryLabel.text = "Salary"
        prepareLayers(object: tableView as Any)
    }
    
    fileprivate func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TableViewEmployeeList", bundle: nil), forCellReuseIdentifier: "TableViewEmployeeList")
        tableView.reloadData()
    }
    
    fileprivate func prepareLayers(object: Any) {
        if let object = object as? UIControl {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        } else if let object = object as? UIView {
            object.layer.cornerRadius = 10
            object.layer.masksToBounds = true
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension CompanyDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewEmployeeList") as! TableViewEmployeeList
        cell.setCell(newWorker: employees[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension CompanyDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
