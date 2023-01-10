//
//  LiveNewsPresenter.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation

class LiveNewsPresenter: LiveNewsListViewToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: LiveNewsListPresenterToViewProtocol?
    var interactor: LiveNewsListPresentorToInteractorProtocol?
    var router: LiveNewsListPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchLiveNews()
    }
    
    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }
    
    func getNews(index: Int) -> LiveNewsModel? {
        return interactor?.news?[index]
    }
}

// MARK: - LiveNewsListInteractorToPresenterProtocol
extension LiveNewsPresenter: LiveNewsListInteractorToPresenterProtocol {
    
    func liveNewsFetched() {
        view?.showNews()
    }
    
    func liveNewsFetchedFailed() {
        view?.showError()
    }
}
