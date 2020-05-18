//
//  DetailView.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/12/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding
    var user: User
    
    var body: some View {
        Text(user.name).onAppear {
            self.user.name = "Detail"
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
