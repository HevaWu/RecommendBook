//
//  ContentView.swift
//  RecommendBook
//
//  Created by ST21235 on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection = 0
    @State var bookTitle: String = ""
    @State var books: [Book] = [
        Book(rel: BookRelation(source: "Book A", reltype: "same author", target: "Book B"))
    ]
 
    var body: some View {
        VStack {
            HStack {
                
                TextField("Type the Book title you want to search", text: $bookTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all)
                
                Button(
                    action: {
                        print("Button Tapped")
                        print(self.$bookTitle)
                },
                    label: {
                        Text("Search")
                        
                })
                    .padding(.all)
                
            }
            
            List(books.indices) { index in
                HStack {
                    Image("default-cover")
                        .resizable()
                        .cornerRadius(4)
                        .frame(width: 50, height: 70, alignment: .leading)
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(self.books[index].title)
                            .bold()
                            .font(.title)
                        Text(self.books[index].relation)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
