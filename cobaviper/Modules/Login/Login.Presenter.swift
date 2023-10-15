//
//  Login.Presenter.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginPresenterProtocol {
    func handleLogin(payloadLogin: LoginPayload)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var router: LoginRouterProtocol?
    var view: LoginProtocol?
    var interactor: LoginInteractorProtocol?
    var bag = DisposeBag()
    
    func handleLogin(payloadLogin: LoginPayload){
        interactor?.postLogin(payload: payloadLogin)
            .subscribe(onNext: { [weak self] value in
            guard let self = self else { return }
                switch(value){
                case .success(let response):
                    let dataUserPayload = DataUser(id: response.id, username: response.username, email: response.email, firstName: response.firstName, lastName: response.lastName, gender: response.gender, image: response.image)
                    self.router?.handleNavigateLogin(dataUser: dataUserPayload)
                case .failure(let error):
                    self.view?.handleViewAfterAction(val: error.localizedDescription)
                }
            }).disposed(by: bag)
    }
}
