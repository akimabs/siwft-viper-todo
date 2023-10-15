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
    var dataTodo: BehaviorSubject<[TDataTodo]> {get set}
    
    func getPayloadFromLogin()
    func storeTodo(dataTodoPayload: TDataTodo)
}

class DashboardInteractor: DashboardInteractorProtocol {
    // MARK: - State
    var dataUser: DataUser?
    var dataTodo = BehaviorSubject<[TDataTodo]>(value: [])
    // MARK: - Property
    var presenter: DashboardPresenterProtocol?
    
    func getPayloadFromLogin(){
        presenter?.updateDataView(dataUser: dataUser)
    }
    
    func storeTodo(dataTodoPayload: TDataTodo){
        var tmpArray: [TDataTodo] = []
        tmpArray.append(dataTodoPayload)
        dataTodo.onNext(tmpArray)
    }
}
