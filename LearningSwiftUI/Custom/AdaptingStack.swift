//
//  AdaptingStack.swift
//  LearningSwiftUI
//
//  Created by Hai Ca on 5/15/20.
//  Copyright © 2020 Justin Nguyen. All rights reserved.
//

import SwiftUI

struct AdaptingStack<Content>: View where Content: View {

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var content: () -> Content
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        switch sizeCategory {
        case .accessibilityLarge,
             .accessibilityExtraLarge,
             .accessibilityExtraExtraLarge,
             .accessibilityExtraExtraExtraLarge:
            return AnyView(VStack(content: self.content).padding(.top, 10))
        default:
            return AnyView(HStack(alignment: .top, content: self.content))
        }
    }
}
