//
//  HomeViewController.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func configureVC()
    func configureTableView()
    func reloadTable()
    func navigateToTodoDetail(todo: ToDo?)
    
}

class HomeViewController: UIViewController {
    
    private let tableView: UITableView = UITableView()
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.view = self
        homeViewModel.viewDidLoad()
        
    }
    
    
}


extension HomeViewController: HomeViewControllerInterface {
    
    func navigateToTodoDetail(todo: ToDo?) {
        DispatchQueue.main.async {
            let detailScreen = DetailViewController(todo: todo)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configureVC() {
        view.backgroundColor = .black
        title = "Todos ✔️"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemMint
        
        NSLayoutConstraint.activate([
            tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = homeViewModel.todos[indexPath.row].title
        cell.backgroundColor = .systemMint
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewModel.getDetail(id: homeViewModel.todos[indexPath.item].id ?? 1)

    }
}



