//
//  AddView.swift
//  iTracker
//
//  Created by Víctor Ávila on 05/04/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Go to Gym"
    @State private var description = ""
    @State private var numberOfTimes = 0
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Activity Description") {
                    TextField("I should exercise 3 times a week to get stronger.", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save Activity", systemImage: "checkmark.circle.fill") {
                        let activity = Activity(title: name, description: description, numberOfTimes: numberOfTimes)
                        activities.activities.append(activity)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel Activity Addition", systemImage: "xmark.circle") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
//    AddView()
}
