//
//  EmployeeTableViewCell.swift
//  DesignPattern_MVVM_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation
import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    var employee : EmployeeData? {
        didSet {
            employeeIdLabel.text = "\(String(describing: employee?.id))"
            employeeNameLabel.text = employee?.employeeName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
