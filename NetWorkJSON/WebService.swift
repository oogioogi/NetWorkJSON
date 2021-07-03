//
//  WebService.swift
//  NetWorkJSON
//
//  Created by 이용석 on 2021/07/03.
//

import Foundation

// Json : https://jsonplaceholder.typicode.com/todos/1
//[{
//  "userId": 1,
//  "id": 1,
//  "title": "delectus aut autem",
//  "completed": false
//}]

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}

class WebService {
    
    func GetTodos(completion: @escaping ([Todo])-> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let hasData = data else {
                return
            }
            
            do {
                let todo =  try JSONDecoder().decode([Todo].self, from: hasData)
                completion(todo)
            }catch {
                print("\(error.localizedDescription)")
            }
            
        }.resume()
    }
    
}
