//
//  ContentView.swift
//  RecommendBook
//
//  Created by ST21235 on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Whole Book List")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Whole Book List")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
