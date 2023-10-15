//
//  Login.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import UIKit
import RxSwift

protocol LoginProtocol {
    var presenter: LoginPresenterProtocol? {get set}
    var usernameValue: String {get set}
    var passwordValue: String {get set}
    var errorMessage: String {get set}
    
    func handleViewAfterAction(val:String)
}


class Login: UIViewController, LoginProtocol {
    // MARK: - State
    var usernameValue: String = ""
    var passwordValue: String = ""
    var errorMessage: String = ""
    
    // MARK: - @IBOutlet
    @IBOutlet weak var fieldUsername: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var labelError: UILabel!
    
    // MARK: - Property
    var presenter: LoginPresenterProtocol?
    var interactor: LoginInteractorProtocol?
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListener()
        setupLayout()
    }
    
    func handleViewAfterAction(val: String){
        labelError?.isHidden = false
        labelError.text = val
        self.buttonLogin?.setEnable(isEnabled: true)
    }
    
    func setupListener(){
        fieldUsername.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { text in
                self.usernameValue = text
                if(!self.usernameValue.isEmpty && !self.passwordValue.isEmpty){
                    self.buttonLogin?.setEnable(isEnabled: true)
                }
            })
            .disposed(by: bag)

        fieldPassword.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { text in
                if(!self.usernameValue.isEmpty && !self.passwordValue.isEmpty){
                    self.buttonLogin?.setEnable(isEnabled: true)
                }
                self.passwordValue = text
            })
            .disposed(by: bag)
        
        buttonLogin.rx.tap.subscribe { [weak self] _ in
            guard let self = self else { return }
            let payloadLogin = LoginPayload(username: self.usernameValue , password: self.passwordValue)
            self.presenter?.handleLogin(payloadLogin: payloadLogin)
            self.buttonLogin?.setEnable(isEnabled: false)
        }.disposed(by: bag)
    }
    
    func setupLayout(){
        self.buttonLogin?.setEnable(isEnabled: false)
        self.labelError?.isHidden = true
        self.fieldUsername.text = ""
        self.fieldPassword.text = ""
    }
}
