//
//  ViewController.swift
//  FirestoreDemo
//
//  Created by Kirti Parghi on 2023-01-11.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController, UITextFieldDelegate {

    let database = Firestore.firestore()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text..."
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(label)
        self.view.addSubview(field)
        self.field.delegate = self
                        
        let docRef = database.collection("kplab").document("example")
        
        //READ DATA FROM FIRESTORE DATABASE
//        docRef.getDocument { [weak self] snapshot, error in
//            guard let data = snapshot?.data(), error == nil else {
//                return
//            }
//
//            guard let text = data["text"] as? String else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.label.text = text
//            }
//        }
        
        //ADD OBSERVER ON DOCUMENT EXAMPLE
        docRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            guard let text = data["text"] as? String else {
                return
            }

            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.field.frame = CGRect(x: 10, y: self.view.safeAreaInsets.top+20, width: self.view.frame.width-20, height: 30)
        self.label.frame = CGRect(x: 10, y: self.field.frame.origin.y+30+20, width: self.view.frame.width-20, height: 30)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.isEmpty != true else { return true }
        self.saveData(text: text)
        return true
    }
    
    func saveData(text: String) {
        //SAVE DATA TO FIRESTORE DATABASE
        let docRef = database.document("kplab/example")
        docRef.setData(["text":text])
    }

}

