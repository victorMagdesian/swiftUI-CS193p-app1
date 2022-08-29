//
//  ContentView.swift
//  Shared
//
//  Created by VICTOR FELIPPE MAGDESIAN on 27/08/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["❤️", "🖍", "💔", "🅰️", "❌", "♨️", "❗️", "💮", "🛑", "⁉️", "🏎", "🚒", "🎸", "🎯"]
    
    @State var emojiCounter = 2
    
    var body: some View {
        VStack {
            Text("MEMORY GAME")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                        ForEach(emojis[0..<emojiCounter], id: \.self,  content: { emoji in
                                CardView(content: emoji)
                                CardView(content: emoji)
                        })
                }
                .padding(.horizontal)
                .foregroundColor(.red)
                Spacer()
            }
                HStack {
                    removeButton
                    Spacer()
                    addButton
                }
                .padding(.horizontal)
                .font(.largeTitle)
        }
    }
    var removeButton: some View {
        Button(action: {self.tapRemoveCard()},
               label: {
            Image(systemName: "minus.circle")
        })
    }
      
    var addButton: some View {
        Button(action: { tapAddCard()},
               label: {
            Image(systemName: "plus.circle")
        })
    }
               
    private func tapAddCard() {
        if emojiCounter < emojis.count {
            emojiCounter += 1
        }
    }
    
    private func tapRemoveCard() {
        if emojiCounter > 1 {
            emojiCounter -= 1
        }
    }
}

struct CardView: View {
    @State private var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            changeFace()
        }
        .aspectRatio(2/3, contentMode: .fit)
}
    private func changeFace() {
        isFaceUp = !isFaceUp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
