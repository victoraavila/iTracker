//
//  DetailView.swift
//  iTracker
//
//  Created by Víctor Ávila on 07/04/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var activity: Activity
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(activity.title)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .padding(.leading, 10)
                
                Text(activity.description)
                    .padding(.bottom, 30)
                
                CustomDividerView()
                    .padding(.horizontal, 20)
                
                Text("Number of Times")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .padding(.leading, 10)
                
                Text("I did \(activity.title) \(activity.numberOfTimes) times.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.bottom, 30)
                
                CustomDividerView()
                    .padding(.horizontal, 20)
                
                HStack {
                    Text("Did you \(activity.title)?")
                        .font(.title.bold())
                        .frame(alignment: .leading)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    ZStack {
                        Button() {
                            activity.numberOfTimes += 1
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
    let activity = Activity(title: "Go to Gym",
                            description: "I should exercise 3 times a week to get stronger.",
                            numberOfTimes: 0)
    
    return DetailView(activity: .constant(activity))
}
