//
//  ViewController.swift
//  DesignPattern_MVVM_Demo
//
//  Created by Kirti Parghi on 2023-01-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeeViewModel: EmployeesViewModel!
    
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    private var delegate : EmployeeTableViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = "\(evm.id)"
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        self.delegate = EmployeeTableViewDelegate()
        
        DispatchQueue.main.async {
            self.employeeTableView.delegate = self.delegate
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}

