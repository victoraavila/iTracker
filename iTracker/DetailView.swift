//
//  DetailView.swift
//  iTracker
//
//  Created by Víctor Ávila on 07/04/24.
//

import SwiftUI

struct DetailView: View {
    var activity: Activity
    var activities: Activities
    
    var body: some View {
        ScrollView {
            VStack {
                Text(activity.title)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                    .padding()
                
                Text(activity.description)
                
                Text("Number of Times")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                    .padding()
                
                Text("I did \(activity.title) \(activity.numberOfTimes) times.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
                HStack {
                    Text("Increment count?")
                        .font(.title.bold())
                        .frame(alignment: .leading)
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    ZStack {
                        Button() {
                            var newActivity = activity
                            newActivity.numberOfTimes += 1
                            let indexOfOldActivity = activities.activities.firstIndex(of: activity)
                            activities.activities[indexOfOldActivity ?? 0] = newActivity
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 50, height: 50)
                        }
                        
                        Text("+")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DetailView(activity: Activity(title: "Go to Gym", 
                                  description: "I should exercise 3 times a week to get stronger.",
                                  numberOfTimes: 0),
               activities: Activities())
}
