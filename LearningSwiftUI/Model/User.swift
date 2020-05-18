//
//  User.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/12/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import Foundation

struct User: Identifiable {
    
    var id = UUID()
    var name: String
    var avatar: String?
    var description: String
}
