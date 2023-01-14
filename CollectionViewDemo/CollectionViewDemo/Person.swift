//
//  Person.swift
//  CollectionViewDemo
//
//  Created by Kirti Parghi on 2023-01-14.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
