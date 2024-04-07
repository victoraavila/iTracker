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
                    ForEach(activities.activities.indices, id: \.self) { activityIndex in
                        NavigationLink(destination: DetailView(activity: $activities.activities[activityIndex])) {
                            VStack {
                                Text(activities.activities[activityIndex].title)
                            }
                        }
                    }
                    .onDelete(perform: removeActivities)
                } header: {
                    Text("Tracked Activities")
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
