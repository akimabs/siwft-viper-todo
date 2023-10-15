//
//  PopupTodo.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import UIKit
import RxSwift


protocol PopupTodoDelegate {
    func didAddTask(description: String)
}

class PopupTodo: UIViewController,PopupTodoDelegate {
    
    var taskDescriptionValue: String = ""
    var delegate: PopupTodoDelegate?
    
    // MARK: - @IBOutlet
    @IBOutlet weak var fieldTask: UITextField!
    @IBOutlet weak var buttonTask: UIButton!
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListener()
        setupLayout()
    }
    
    func setupListener(){
        fieldTask.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { text in
                self.taskDescriptionValue = text
                if(!self.taskDescriptionValue.isEmpty){
                    self.buttonTask?.setEnable(isEnabled: true)
                }
            })
            .disposed(by: bag)
        
        buttonTask.rx.tap.subscribe { [weak self] _ in
            guard let self = self else { return }
            let payloadTask = TDataTodo(description: self.taskDescriptionValue)
            self.buttonTask?.setEnable(isEnabled: false)
            delegate?.didAddTask(description: self.taskDescriptionValue)
            self.dismiss(animated: true, completion: nil)
        }.disposed(by: bag)
    }
    
    func didAddTask(description: String){
        
    }
    
    func setupLayout(){
        self.buttonTask?.setEnable(isEnabled: false)
        self.fieldTask.text = ""
    }
}
