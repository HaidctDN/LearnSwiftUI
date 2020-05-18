//
//  ContentView.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/8/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject
    private var viewModel: HomeViewModel = HomeViewModel()
    
    init() {
        viewModel.fetchData()
    }
    
    var body: some View {
        return NavigationView {
            List {
                ForEach(viewModel.users.indexed(), id: \.1.id) { index, user in
                    NavigationLink(destination: DetailView(user: self.$viewModel.users[index])) {
                        UserView(user: self.$viewModel.users[index])
                    }
                }
            }
            .padding(.horizontal,-20)
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItems(trailing: Image("icons8-add-48").onTapGesture {
                self.viewModel.addItem(user: User(name: String.randomString(length: 7),
                                                  description: String.randomString(length: Int.random(in: 0...999))))
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
//            .environment(\.colorScheme, .dark)
    }
}

extension String {

    static func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
    typealias Index = Base.Index
    typealias Element = (index: Index, element: Base.Element)

    let base: Base

    var startIndex: Index { base.startIndex }

    var endIndex: Index { base.endIndex }

    func index(after i: Index) -> Index {
        base.index(after: i)
    }

    func index(before i: Index) -> Index {
        base.index(before: i)
    }

    func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }

    subscript(position: Index) -> Element {
        (index: position, element: base[position])
    }
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self> {
        IndexedCollection(base: self)
    }
}
