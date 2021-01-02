//
//  Assistant.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 18.12.2020.
//

class Assistant: EmployeeP {
    override func getCost() -> Int {
        return super.getCost() + age * 100
    }
}
