//
//  Dashboard.Router.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation
import UIKit

protocol DashboardRouterProtocol {
    var entry: Dashboard? {get}
    static func navigateDashboard(with dataUser: DataUser) -> DashboardRouter
}

class DashboardRouter: DashboardRouterProtocol {
    var entry: Dashboard?
    
    static func navigateDashboard(with dataUser: DataUser) -> DashboardRouter {
        let router = DashboardRouter()
        let view = Dashboard()
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.dataUser = dataUser
        
        router.entry = view
        
        return router
    }
    
    func showPopup() {
        let popupTodo = PopupTodo()
        popupTodo.modalPresentationStyle = .custom
        popupTodo.modalTransitionStyle = .coverVertical
        entry?.present(popupTodo, animated: true, completion: nil)
    }
}
