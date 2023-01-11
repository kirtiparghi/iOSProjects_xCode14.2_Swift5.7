//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Kirti Parghi on 2023-01-11.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
        
        //ref.child("someid/name").setValue("Kirti")
        
        //Writing Data
        //ref.childByAutoId().setValue(["name":"kirti", "role":"admin", "age":31])
        
        //Reading Data
        //Reading Individual child elements
//        ref.child("-NLXHS1cyan6t0uUxbSU/name").observeSingleEvent(of: .value) { (snapshot) in
//            let name = snapshot.value as? String
//            print(name!)
//        }
        
        //Reading whole dictionary
//        ref.child("-NLXHS1cyan6t0uUxbSU").observeSingleEvent(of: .value) { (snapshot) in
//
//            let employeeData = snapshot.value as? [String:Any]
//            print("Employee Data ---> \(employeeData!)")
//
//        }
        
        //Updating data (You can also update all values at once.)
        //ref.child("-NLXHS1cyan6t0uUxbSU/name").setValue("John")
     
        //Delete data
        //ref.child("-NLXHS1cyan6t0uUxbSU").removeValue()
    }
}
