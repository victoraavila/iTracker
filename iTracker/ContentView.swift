//
//  ContentView.swift
//  iTracker
//
//  Created by Víctor Ávila on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(activities.activities) { activity in
                        NavigationLink(value: activity) {
                            VStack {
                                Text(activity.title)
                            }
                        }
                    }
                    .onDelete(perform: removeActivities)
                } header: {
                    Text("Tracked Activities")
                }
            }
            .navigationDestination(for: Activity.self) { activity in
                DetailView(activity: activity, activities: activities)
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
