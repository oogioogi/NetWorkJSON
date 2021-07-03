//
//  ContentView.swift
//  NetWorkJSON
//
//  Created by 이용석 on 2021/07/03.
//


// Json : https://jsonplaceholder.typicode.com/todos/1
// List 말고 lazyGrid 추천
import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible())],alignment:.leading , content: {
                ForEach(todos) { todo in
                    Text("userId = \(todo.userId!)").padding(.top, 10)
                    Text("id = \(todo.id!)")
                    Text("title = \(todo.title!)")
                    Text("completed = \(todo.completed!.description)")
                        .foregroundColor(todo.completed == true ? .red : .green)
                }
            })
        }.onAppear{
            WebService().GetTodos { todos in
                self.todos = todos
            }
            
            //        List(todos) { todo in
            //            VStack(alignment: .leading ) {
            //                Text("\(todo.userId!)")
            //                Text("\(todo.id!)")
            //                Text("\(todo.title!)")
            //                Text("\(todo.completed!.description)")
            //            }
            //        }.onAppear {
            //            WebService().GetTodos { todos in
            //                self.todos = todos
            //            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
