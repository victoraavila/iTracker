//
//  ContentView.swift
//  iTracker
//
//  Created by Víctor Ávila on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    
    let prioritiesAndColors = ["Low": Color(.green), "Medium": Color(.yellow), "High": Color(.red)]
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach($activities.activities) { $activity in
                        NavigationLink(destination: DetailView(activity: $activity)) {
                            VStack {
                                Text(activity.title)
                                    .frame(height: 40)
                            }
                        }
                        .listRowBackground(prioritiesAndColors[activity.priority])
                    }
                    .onDelete(perform: removeActivities)
                } header: {
                    Text(activities.activities.count > 0 ? "Tracked Activities" : "")
                }
            }
                .navigationTitle("iTracker")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Activity", systemImage: "plus.circle") {
                            showingAddActivity = true
                        }
                    }
                }
                .sheet(isPresented: $showingAddActivity, content: {
                    AddView(activities: activities)
                })
        }
    }
    
    func removeActivities(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
