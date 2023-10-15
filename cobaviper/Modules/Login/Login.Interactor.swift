//
//  Login.Interactor.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol LoginInteractorProtocol {
    func postLogin(payload: LoginPayload) -> Observable<(Result<LoginResponse, Error>)>
}

class LoginInteractor: LoginInteractorProtocol {
    var presenter: LoginPresenter?
    var view: LoginProtocol?
    
    func postLogin(payload: LoginPayload) -> Observable<(Result<LoginResponse, Error>)>  {
        let loginResponse = PublishSubject<(Result<LoginResponse, Error>)>()
        AF.request("https://dummyjson.com/auth/login", method: .post, parameters: payload, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success:
                if let value = response.data {
                    do {
                        let res = try JSONDecoder().decode(LoginResponse.self, from: value)
                        loginResponse.onNext(.success(res))
                    } catch _ {
                        loginResponse.onNext(.failure(NSError(domain: "Invalid Credential", code: response.response?.statusCode ?? 500, userInfo: nil)))
                    }
                } else {
                    loginResponse.onNext(.failure(NSError(domain: "Server Error", code: response.response?.statusCode ?? 500, userInfo: nil)))
                }
            case .failure(let error):
                    loginResponse.onNext(.failure(error))
                }
        }
        return loginResponse
    }
}
