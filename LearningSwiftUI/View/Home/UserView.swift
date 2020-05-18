//
//  UserView.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/8/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import SwiftUI

struct UserView: View {
    @Binding
    var user: User
    @State
    var isLoading: Bool = true

    var body: some View {
        ZStack {
            AdaptingStack {
                Image(self.user.avatar ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .padding(10)
                    .clipped()
                    .background(Color.gray)
                VStack(alignment: .leading) {
                    Text(self.user.name)
                        .foregroundColor(Color.secondary)
                    Text(self.user.description)
                }
                Spacer()
            }
            if isLoading {
                ActivityIndicator(style: .large)
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
            }
        }
    }
}
