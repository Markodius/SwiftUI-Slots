//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by Mykola on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstSlot = "apple"
    @State private var secondSlot = "cherry"
    @State private var thirdSlot = "star"
    @State private var score = 1000
    @State private var elements = ["apple","cherry", "star"]
    
    var body: some View {
        VStack {
            // Title
            Text("Swift UI Slots")
                .font(.largeTitle)
            Spacer()
            
            
            // Score
            Text("Credits: " + String(score))
                .font(.system(size: 24))
            Spacer()
            
            // Slots
            HStack {
                Image(firstSlot)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(secondSlot)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(thirdSlot)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            
            // Button
            Button {
                var randomSlotValue: String?
                
                func randomSlotElement(slotValue: inout String) {
                    if let randomElement = elements.randomElement() {
                        randomSlotValue = randomElement
                        slotValue = randomSlotValue!
                    } else {
                        print("Error in array")
                    }
                }
                
                randomSlotElement(slotValue: &firstSlot)
                randomSlotElement(slotValue: &secondSlot)
                randomSlotElement(slotValue: &thirdSlot)
                
                if firstSlot != secondSlot && firstSlot != thirdSlot {
                    score -= 5
                } else if secondSlot != firstSlot && secondSlot != thirdSlot {
                    score -= 5
                } else if thirdSlot != firstSlot && thirdSlot != secondSlot {
                    score -= 5
                } else {
                    score += 30
                }
                
            } label: {
                Text("Spin")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                    .background(.pink)
                    .cornerRadius(15)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
