//
//  CompanyBuilder.swift
//  myCompanyScreen
//
//  Created by Berkin KABADAYI on 19.12.2020.
//

class CompanyBuilder {
    
    private let companyNew = CompanyP()
    
    init() {
        
        let baris = Assistant()
        let berkin = Assistant()
        let ahmet = Director()
        let kaan = Director()
        // Add employee Baris
        baris.age = 20
        baris.name = "Barış"
        
        // Add employee Berkin
        berkin.age = 25
        berkin.name = "Berkin"
        
        // Add employee Ahmet
        ahmet.age = 30
        ahmet.name = "Ahmet"
        
        // Add employee Kaan
        kaan.age = 35
        kaan.name = "Kaan"
        
        companyNew.addNewEmployee(newEmployee: baris)
        companyNew.addNewEmployee(newEmployee: berkin)
        companyNew.addNewEmployee(newEmployee: ahmet)
        companyNew.addNewEmployee(newEmployee: kaan)
    }

    func getCompanyNew() -> CompanyP {
        return companyNew
    }
}
