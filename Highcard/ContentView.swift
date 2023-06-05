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
    @State var deck: [Int] = Array(repeating: 0, count: 52)
    
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
                Text("Cards left in deck: \(deck.count)").font(.title)
                    .bold()
                    .padding()
                Button {
                    if deck.count == 0 {
                        reset()
                    }
                    else {
                        if deck[0] == 0 {
                            shuffle()
                        }
                        deal()
                    }
                } label: {
                    if deck.count == 0 {
                        Image("reset")
                    }
                    else {
                        Image("deal")
                    }
                }
                Text(message).font(.largeTitle)
                    .bold()
                    .padding()
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
        var card: Int = deck.randomElement()!
        var index: Int = deck.firstIndex(of: card)!
        card1 = deck.remove(at: index)
        card = deck.randomElement()!
        index = deck.firstIndex(of: card)!
        card2 = deck.remove(at: index)
        if card1 > card2 {
            score1 += 1
            if deck.count == 0 {
                declareWinner()
            }
            else {
                message = "Player wins!"
            }
        }
        else if card2 > card1 {
            score2 += 1
            if deck.count == 0 {
                declareWinner()
            }
            else {
                message = "CPU wins!"
            }
        }
        else {
            if deck.count == 0 {
                declareWinner()
            }
            else {
                message = "It's a draw!"
            }
        }
    }
    
    func shuffle() {
        deck = []
        for _ in 1...4 {
            for i in 2...14 {
                deck.append(i)
            }
        }
    }
    
    func reset() {
        shuffle()
        score1 = 0
        score2 = 0
        card1 = 0
        card2 = 0
        message = ""
    }
    
    func declareWinner() {
        if score1 > score2 {
            message = "Player won the game!"
        }
        else if score2 > score1 {
            message = "CPU won the game!"
        }
        else {
            message = "The game was a draw!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
