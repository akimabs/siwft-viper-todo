//
//  Dashboard.Interactor.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation
import RxSwift

protocol DashboardInteractorProtocol {
    var presenter: DashboardPresenterProtocol? {get set}
    var dataUser: DataUser? {get set}
    
    func getPayloadFromLogin()
    func storeTodo(dataTodoPayload: TDataTodo)
}

class DashboardInteractor: DashboardInteractorProtocol {
    // MARK: - Property
    var presenter: DashboardPresenterProtocol?
    var dataUser: DataUser?
    
    func getPayloadFromLogin(){
        presenter?.updateDataView(dataUser: dataUser)
    }
    
    func storeTodo(dataTodoPayload: TDataTodo){
        var tmpArray: [TDataTodo] = []
        tmpArray.append(dataTodoPayload)
        presenter?.dataTodo.onNext(tmpArray)
    }
}
