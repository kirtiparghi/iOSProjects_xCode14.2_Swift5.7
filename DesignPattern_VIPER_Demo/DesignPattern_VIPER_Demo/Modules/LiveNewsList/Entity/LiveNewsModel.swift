//
//  LiveNewsModel.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

struct LiveNewsModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}
