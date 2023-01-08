//
//  DetailViewModel.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 8.01.2023.
//

import Foundation

protocol DetailViewModelInterface {
    
    var viewController: DetailViewController? { get set }
    
    func viewDidLoad()
}

class DetailViewModel {
    
    weak var viewController: DetailViewController?

    
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        viewController?.configureVC()
        viewController?.configureTitleLabel()
        viewController?.configureIsDone()
    }
}
