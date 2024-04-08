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
            .foregroundStyle(Color(.white))
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
