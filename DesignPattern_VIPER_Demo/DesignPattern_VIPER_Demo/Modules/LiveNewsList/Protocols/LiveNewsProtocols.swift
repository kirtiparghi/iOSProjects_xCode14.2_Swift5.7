//
//  LiveNewsProtocols.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation
import UIKit

protocol LiveNewsListPresenterToViewProtocol : AnyObject {
    func showNews()
    func showError()
}

protocol LiveNewsListViewToPresenterProtocol : AnyObject {
    var view: LiveNewsListPresenterToViewProtocol? {get set}
    var interactor: LiveNewsListPresentorToInteractorProtocol? { get set }
    var router: LiveNewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> LiveNewsModel?
}

protocol LiveNewsListPresentorToInteractorProtocol : AnyObject {
    var presenter: LiveNewsListInteractorToPresenterProtocol? { get set }
    var news: [LiveNewsModel]? { get }
    
    func fetchLiveNews()
}

protocol LiveNewsListInteractorToPresenterProtocol : AnyObject {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol LiveNewsListPresenterToRouterProtocol : AnyObject {
    static func createModule() -> UIViewController
}
