//
//  Employee.swift
//  DesignPattern_MVVM_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

//MARK: - Employee
struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

//MARK: - EmployeeData
struct EmployeeData: Decodable {    
    let id : Int
    let employeeName : String
    let employeeSalary, employeeAge : Int
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
