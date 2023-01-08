//
//  DetailViewController.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 8.01.2023.
//

import UIKit

protocol DetailViewControllerInterface: AnyObject {
    func configureVC()
    func configureTitleLabel()
    func configureIsDone()
    
}

class DetailViewController: UIViewController {
    
    let todo: ToDo?
    private let detailViewModel = DetailViewModel()
    
    private var todoTitleLabel: UILabel!
    private var isDone: UIImageView!
    
    private let padding: CGFloat = 16
    
    init(todo: ToDo?) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        detailViewModel.viewController = self
        detailViewModel.viewDidLoad()
    }
    
    
}


extension DetailViewController: DetailViewControllerInterface {
    
    func configureVC() {
        title = "Detail of Todo"
        view.backgroundColor = .systemGray
    }
    
    func configureTitleLabel() {
        todoTitleLabel = UILabel()
        view.addSubview(todoTitleLabel)
        todoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todoTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            todoTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            todoTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        todoTitleLabel.numberOfLines = 0
        todoTitleLabel.text = todo?.title
        
    }
    
    func configureIsDone() {
        isDone = UIImageView(image: UIImage(
            systemName: todo?.completed ?? false ? "circle.fill" : "circle"
        ))
        view.addSubview(isDone)
        isDone.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            isDone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            isDone.topAnchor.constraint(equalTo: todoTitleLabel.bottomAnchor, constant: padding),
        ])
        


    }
    
}
