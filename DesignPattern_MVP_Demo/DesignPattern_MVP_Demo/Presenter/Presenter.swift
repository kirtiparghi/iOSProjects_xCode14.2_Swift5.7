//
//  Presenter.swift
//  DesignPattern_MVP_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

protocol PresenterView: AnyObject {
    func updateLabel()
}

class Presenter {
    
    weak var view: PresenterView?
    
    //Pass somthing that conforms to presenterview
    init(with view: PresenterView) {
        self.view = view
    }
    
    var timerTapped = 0
    
    func buttonTapped() {
        timerTapped += 1
        if timerTapped >= 5 {
            self.view?.updateLabel()
        }
    }
}
