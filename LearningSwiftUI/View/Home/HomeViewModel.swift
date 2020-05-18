//
//  HomeViewModel.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/12/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {

    @Published
    var users: [User] = [User]() {
        didSet {
            didChange.send(self)
        }
    }

    func fetchData() {
        for _ in 0...10 {
            users.append(User(name: "Hai",
                              avatar: "46460727_1085992888234079_2560312485697552384_n",
                              description: "De" + String(Int.random(in: 1...100))))
        }
        users.append(User(name: "AAAAAA",
                          avatar: "46460727_1085992888234079_2560312485697552384_n",description: "samdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasdsamdkamskdmasd"))
    }
    
    func addItem(user: User) {
        users.append(user)
    }
    
    let didChange = PassthroughSubject<HomeViewModel, Never>()
}
