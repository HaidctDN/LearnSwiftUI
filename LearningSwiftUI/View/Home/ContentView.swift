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
    
    var body: some View {
        return NavigationView {
            List(viewModel.users) { item in
                NavigationLink(destination: DetailView().environmentObject(item)) {
                    UserView(user: item)
                }
            }
            .padding(.horizontal,-20)
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItems(trailing: Image("icons8-add-48").onTapGesture {
//                self.viewModel.addItem(user: User(name: String.randomString(length: 7),
//                                                  description: String.randomString(length: Int.random(in: 0...999))))
                
            })
                .onAppear {
                    print(self.viewModel.users.first?.name)
            }
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
