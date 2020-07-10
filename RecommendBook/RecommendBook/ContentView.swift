//
//  ContentView.swift
//  RecommendBook
//
//  Created by ST21235 on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var bookTitle: String = ""
    
    let bookFinder = BookRelationFinder()
 
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                TextField("Type the Book title you want to search", text: $bookTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all)
                
                Button(
                    action: findRelatedBooks,
                    label: {
                        Text("Search")
                        
                })
                    .padding(.all)
                
            }
            
            Text("Search Result: ")
                .bold()
                .padding(.leading, 15)
                .font(.largeTitle)
            
            List(bookFinder.booksData) { book in
                HStack {
                    Image("default-cover")
                        .resizable()
                        .cornerRadius(4)
                        .frame(width: 50, height: 70, alignment: .leading)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(book.title)
                            .bold()
                        Text(book.relation)
                    }
                }
            }
        }
    }
    
    func findRelatedBooks() {
        bookFinder.findRelatedBooks(title: bookTitle)
//        bookFinder.findRelatedBooks(title: bookTitle, completion: { res in
//            switch res {
//            case let .success(_books):
//                print(_books)
//                DispatchQueue.main.async {
//                    self.books = _books
//                }
//            case let .failure(error):
//                print("Failed to find related books: \(error.localizedDescription)")
//            }
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
