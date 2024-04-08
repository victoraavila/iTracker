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
    @State private var selectedCategory = "Exercises"
    @State private var selectedPriority = "High"
    @State private var numberOfTimes = 0
    
    let categoriesAndAssets = ["Exercises": "gym", "Practice": "guitar", "Study": "study", "Eating healthly": "fruits"]
    let priorities = ["Low", "Medium", "High"]
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Activity Description") {
                    TextField("I should exercise 3 times a week to get stronger.", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section("Activity Category") {
                    Picker(selection: $selectedCategory, label: Text("Category")) {
                        ForEach(Array(categoriesAndAssets.keys), id: \.self) { (key) in
                            HStack {
                                Text(key)
                            }
                        }
                    }
                    .labelsHidden()
                }
                
                Section("Activity Priority") {
                    Picker(selection: $selectedPriority, label: Text("Priority")) {
                        ForEach(priorities, id: \.self) { priority in
                            Text(priority)
                        }
                    }
                    .labelsHidden()
                }
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save Activity", systemImage: "checkmark.circle.fill") {
                        let activity = Activity(title: name, 
                                                description: description,
                                                category: selectedCategory,
                                                priority: selectedPriority,
                                                numberOfTimes: numberOfTimes)
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
