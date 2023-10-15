//
//  Dashboard.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import UIKit
import RxSwift

protocol DashboardProtocol {
    var presenter: DashboardPresenterProtocol? {get set}
    
    func update(with dataUser: DataUser?)
    func didAddTask(description:String)
    func showPopup()
}

class Dashboard: UIViewController, DashboardProtocol, PopupTodoDelegate {
    // MARK: - Property
    var presenter: DashboardPresenterProtocol?
    var bag = DisposeBag()
    var tasks: [TDataTodo] = []

    // MARK: - @IBOutlet
    @IBOutlet weak var labelGreeting: UILabel!
    @IBOutlet weak var buttonAddTask: UIButton!
    @IBOutlet weak var tableTaskTodo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCLick()
        presenter?.viewDidLoad()
    }
    
    func setupCLick(){
        buttonAddTask.rx.tap.subscribe { [weak self] _ in
            guard let self = self else { return }
            presenter?.userDidTapShowPopup()
        }.disposed(by: bag)
        
        tableTaskTodo.dataSource = self
        self.presenter?.interactor?.dataTodo
              .asObservable()
              .subscribe(onNext: { [weak self] tasks in
                  self?.tasks += tasks
                  self?.tableTaskTodo.reloadData()
              })
              .disposed(by: bag)
    }
    
    func showPopup(){
        let popupTodo = PopupTodo()
        popupTodo.delegate = self
        present(popupTodo, animated: true, completion: nil)
    }
}

extension Dashboard {
    func update(with dataUser: DataUser?) {
        if let dataUser = dataUser {
            self.labelGreeting.text = "HI, \(dataUser.username)"
        }
    }
    func didAddTask(description: String) {
        let payloadDataTodo = TDataTodo(description: description)
        self.presenter?.addDataTodo(dataPayloadTodo: payloadDataTodo)
    }
}

extension Dashboard: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].description
        cell.contentConfiguration = content
        return cell
    }
}
