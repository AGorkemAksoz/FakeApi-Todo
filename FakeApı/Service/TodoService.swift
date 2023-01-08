//
//  TodoService.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import Foundation

class TodoService {
    static let shared = TodoService()
    private init() { }
    
    func getTodoItems(completion: @escaping ([ToDo]?, String?) -> ()) {
        NetworkManager.shared.request(type: [ToDo].self, url: APIURL.getURL(), method: .get) { response in
            switch response {
            case .success(let items):
                completion(items, nil)
            case .failure(let failure):
                completion(nil, failure.rawValue)
            }
        }
    }
    
    func getDetail(id: Int, completion: @escaping (ToDo?, String?) -> ()) {
        guard let url = APIURL.getDetail(id: id) else { return }
        
        NetworkManager.shared.request(type: ToDo.self, url: url, method: .get) { response in
            switch response {
            case .success(let item):
                completion(item, nil)
            case .failure(let failure):
                completion(nil, failure.localizedDescription)
            }
        }
    }
}
    
