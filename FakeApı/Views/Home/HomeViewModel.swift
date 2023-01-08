//
//  HomeViewModel.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var view: HomeViewControllerInterface? { get set }
    
    func viewDidLoad()
    func getTodos()
}

final class HomeViewModel {
    weak var view: HomeViewControllerInterface?
    var todos = [ToDo]()
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureTableView()
        getTodos()
    }
    
    func getTodos() {
        TodoService.shared.getTodoItems { items, errorMessage in
            if let items = items {
                self.todos = items
                self.view?.reloadTable()
            }
        }
    }
    
    func getDetail(id: Int) {
        TodoService.shared.getDetail(id: id) { [weak self] item, _ in
            guard let self = self else { return }
            guard let item = item else { return }
            
            self.view?.navigateToTodoDetail(todo: item)
        }
    }
    
}
