//
//  DividerView.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height:2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
