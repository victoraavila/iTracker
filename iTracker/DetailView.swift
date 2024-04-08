//
//  DetailView.swift
//  iTracker
//
//  Created by Víctor Ávila on 07/04/24.
//

import SwiftUI

struct DetailView: View {
    let categoriesAndAssets = ["Exercises": "gym", "Practice": "guitar", "Study": "study", "Eating healthly": "fruits"]
    let prioritiesAndColors = ["Low": Color(.green), "Medium": Color(.yellow), "High": Color(.red)]
    
    @Binding var activity: Activity
    
    let startRadius: CGFloat = 0
    let endRadius: CGFloat = 200
    
    var body: some View {
        ScrollView {
            HStack {
                Image(categoriesAndAssets[activity.category] ?? "gym")
                
                Text(activity.title)
                    .font(.title.bold())
                    .foregroundStyle(Color(.black))
                    .frame(alignment: .center)
                    .padding(.bottom, 5)
            }
            .background(
                Image("brush")
                    .resizable()
                    .frame(width: 400, height: 75)
            )

            VStack() {
                Text(activity.description.isEmpty ? "I didn't add a description for this activity." : activity.description)
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                CustomDividerView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                
                Text("Number of Times")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)
                    .padding(.leading, 10)
                
                Text("I did \(activity.title) \(activity.numberOfTimes) times.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                
                CustomDividerView()
                    .padding(.horizontal, 30)
                
                
                HStack {
                    Text("Did you \(activity.title)?")
                        .font(.title.bold())
                        .frame(alignment: .leading)
                        .padding(.leading, 30)
                    
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
                    .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.bottom, 30)
            }
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.primary, lineWidth: 2.5)
                    .padding(.horizontal)
                     )
        }
        .background(
            ZStack {
                RadialGradient(
                    colors: [prioritiesAndColors[activity.priority] ?? Color(.green), .green.opacity(0)],
                    center: .bottomLeading,
                    startRadius: startRadius,
                    endRadius: 800
                )
                RadialGradient(
                    colors: [prioritiesAndColors[activity.priority] ?? Color(.green), .green.opacity(0)],
                    center: .topTrailing,
                    startRadius: startRadius,
                    endRadius: 800
                )
                RadialGradient(
                    colors: [prioritiesAndColors[activity.priority] ?? Color(.green), .green.opacity(0)],
                    center: .topLeading,
                    startRadius: startRadius,
                    endRadius: 800
                )
            }
            .ignoresSafeArea()
        )
    }
}

#Preview {
    let activity = Activity(title: "Go to Gym",
                            description: "I should exercise 3 times a week to get stronger.",
                            category: "Exercises",
                            priority: "High",
                            numberOfTimes: 0)
    
    return DetailView(activity: .constant(activity))
}
