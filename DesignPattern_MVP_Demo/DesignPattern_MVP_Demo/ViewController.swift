//
//  ViewController.swift
//  DesignPattern_MVP_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import UIKit

class ViewController: UIViewController, PresenterView {

    lazy var presenter  = Presenter(with: self)
    
    @IBOutlet weak var changeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapMeButton(_ sender: Any) {
        presenter.buttonTapped()
    }
    
    func updateLabel() {
        changeTextLabel.text = "I have been changed!"
        self.view.backgroundColor = .yellow
    }
}

