//
//  Login.Router.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation

protocol LoginRouterProtocol {
    var entry: Login? {get}
    static func StartExecution() -> LoginRouterProtocol
    func handleNavigateLogin(dataUser: DataUser)
}

class LoginRouter: LoginRouterProtocol {
    var entry: Login?
    
    static func StartExecution() -> LoginRouterProtocol {
        let router = LoginRouter()
        let view = Login()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        router.entry = view
        return router
    }
    
    func handleNavigateLogin(dataUser: DataUser){
        let detailRouter = DashboardRouter.navigateDashboard(with: dataUser)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
