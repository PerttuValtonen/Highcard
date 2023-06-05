//
//  ContentView.swift
//  Highcard
//
//  Created by Perttu Valtonen on 5.6.2023.
//

import SwiftUI

let foregroundGradient = LinearGradient(
    colors: [Color.white, Color.gray],
    startPoint: .top, endPoint: .bottom)

let titleGradient = LinearGradient(
    colors: [Color.orange, Color.yellow],
    startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    @State var score1: Int = 0
    @State var score2: Int = 0
    @State var card1: Int = 0
    @State var card2: Int = 0
    @State var message: String = ""
    
    var body: some View {
        ZStack {
            Image("background-cloth")
            VStack {
                Text("High Card Game").font(.largeTitle)
                    .bold()
                    .italic()
                    .foregroundStyle(titleGradient)
                HStack {
                    Text("Player card").font(.title)
                        .bold()
                        .padding()
                    Text("CPU card").font(.title)
                        .bold()
                        .padding()
                }
                HStack {
                    Spacer()
                    Image("card\(card1)").padding()
                    Spacer()
                    Image("card\(card2)").padding()
                    Spacer()
                }
                Button {
                    deal()
                } label: {
                    Image("deal")
                }
                Text(message).font(.largeTitle)
                    .bold()
                    .bold()
                HStack {
                    VStack {
                        Text("Player").font(.title)
                            .bold()
                            .padding()
                        Text("Score: \(score1)")
                    }.font(.largeTitle)
                        .bold()
                        .padding()
                    VStack {
                        Text("CPU").font(.title)
                            .bold()
                            .padding()
                        Text("Score: \(score2)")
                    }.font(.largeTitle)
                        .bold()
                        .padding()
                }
            }
        }.foregroundStyle(foregroundGradient)
            .ignoresSafeArea()
    }
    
    func deal() {
        card1 = Int.random(in: 2...14)
        card2 = Int.random(in: 2...14)
        if card1 > card2 {
            score1 += 1
            message = "Player wins!"
        }
        if card2 > card1 {
            score2 += 1
            message = "CPU wins!"
        }
        else {
            message = "It's a draw!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
