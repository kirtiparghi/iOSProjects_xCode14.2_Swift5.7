//
//  EmployeesViewModel.swift
//  DesignPattern_MVVM_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

class EmployeesViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var empData: Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFunToGetEmpData()
    }
    
    func callFunToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            self.empData = empData
        }        
    }
}
