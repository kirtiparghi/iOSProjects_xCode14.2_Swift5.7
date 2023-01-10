//
//  LiveNewsRouter.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import Foundation
import UIKit

class LiveNewsRouter: LiveNewsListPresenterToRouterProtocol {
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = LiveNewsListViewController()
        let presenter: LiveNewsListViewToPresenterProtocol & LiveNewsListInteractorToPresenterProtocol = LiveNewsPresenter()
        let interactor: LiveNewsListPresentorToInteractorProtocol = LiveNewsInteractor()
        let router: LiveNewsListPresenterToRouterProtocol = LiveNewsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
