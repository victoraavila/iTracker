//
//  CustomDividerView.swift
//  iTracker
//
//  Created by Víctor Ávila on 07/04/24.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.3))
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
