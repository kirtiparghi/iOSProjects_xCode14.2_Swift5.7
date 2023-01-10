//
//  ViewController.swift
//  CoreDataUserDemo
//
//  Created by Kirti Parghi on 2023-01-10.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var array =  [NSManagedObject]()
    var appDelegate: AppDelegate!
    var context : NSManagedObjectContext!
    
    //MARK: - View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
        setupTableView()
        setupNavigationBar()
    }
    
    //MARK: - Fetch User Data Method
    func fetchUserData() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                //request.predicate = NSPredicate(format: "age = %@", "21")
        request.returnsObjectsAsFaults = false
        do {
                let result = try context.fetch(request)
                self.array = result as! [NSManagedObject]
                self.tableView.reloadData()
        } catch {
            print("Failed")
        }
    }
    
    //MARK: - Setup Tableview
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "cellIdentifier")
        self.tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    //MARK: - Setup Navigation Bar
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    //MARK: - Add New User Method
    @objc func addTapped() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add a new user", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Enter username"
        }

        alert.addTextField { (textField) in
            textField.placeholder = "Enter password"
        }

        alert.addTextField { (textField) in
            textField.placeholder = "Enter email"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            self.context = self.appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: self.context)
            let newUser = NSManagedObject(entity: entity!, insertInto: self.context)
            
            newUser.setValue(alert?.textFields![0].text, forKey: "username")
            newUser.setValue(alert?.textFields![1].text, forKey: "password")
            newUser.setValue(alert?.textFields![2].text, forKey: "email")
            
            do {
                try self.context.save()
                self.fetchUserData()
             } catch {
              print("Error saving")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true)
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: - Tableview Data Sources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! UserCell
        cell.lblUserName.text = String("\(self.array[indexPath.row].value(forKey: "username")!)")
        cell.lblEmail.text = String("\(self.array[indexPath.row].value(forKey: "email")!)")
        return cell as UITableViewCell
    }
    
    //MARK: - Tableview Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.context = self.appDelegate.persistentContainer.viewContext
            self.context.delete(array[indexPath.row])
            do {
                try self.context.save()
                self.fetchUserData()
            } catch {
                print("Delete operation failed.")
            }
        }
    }
}

