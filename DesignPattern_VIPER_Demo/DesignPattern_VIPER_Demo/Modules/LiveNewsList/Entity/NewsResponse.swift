//
//  NewsResponse.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let source: String?
    let sortBy: String?
    let articles: [LiveNewsModel]?
}
