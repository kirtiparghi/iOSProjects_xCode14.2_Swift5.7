//
//  EmployeeTableViewDelegate.swift
//  DesignPattern_MVVM_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation
import UIKit

class EmployeeTableViewDelegate : NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
