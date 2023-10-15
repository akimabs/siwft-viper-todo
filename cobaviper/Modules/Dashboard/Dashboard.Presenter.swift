//
//  Dashboard.Presenter.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation

protocol DashboardPresenterProtocol{
    var view: DashboardProtocol? {get set}
    var interactor: DashboardInteractorProtocol? {get set}
    var router: DashboardRouterProtocol? {get set}
    
    func addDataTodo(dataPayloadTodo: TDataTodo)
    func updateDataView(dataUser: DataUser?)
    func userDidTapShowPopup()
    func viewDidLoad()
}

class DashboardPresenter: DashboardPresenterProtocol {
    
    // MARK: - Property
    var view: DashboardProtocol?
    var interactor: DashboardInteractorProtocol?
    var router: DashboardRouterProtocol?
    
    func updateDataView(dataUser: DataUser?){
        view?.update(with: dataUser)
    }
    
    func viewDidLoad(){
        interactor?.getPayloadFromLogin()
    }
    
    func addDataTodo(dataPayloadTodo: TDataTodo){
        interactor?.storeTodo(dataTodoPayload: dataPayloadTodo)
    }
    
    func userDidTapShowPopup() {
        view?.showPopup()
    }
}
