//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by Anna Filin on 30/09/2024.
//

import SwiftUI

struct ContentView: View {
    static let movesArr = ["Rock", "Paper", "Scissors"]
    static let winningMoves = ["Paper", "Scissors", "Rock"]
    static let colors = [Color.gray, Color.green, Color.orange ]
    
    @State private var isAccomplished = false
    @State private var message = ""
    @State private var roundDone = false
    @State private var youPlayed = ""
    @State private var yourMove = -1
    
    @State private var movesDone = 0
    @State private var score = 0
    @State private var computerMove = Int.random(in: 0...2)
    @State private var computerPlayed = ""
    
    @State private var winningMove = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Choose your move...")
                .foregroundStyle(.secondary)
                .font(.title.weight(.heavy))
                .padding(.bottom)
            
            ForEach(0..<3) { number in
                Button {
                    moveDone(number)
                } label: {
                    Text("\(ContentView.movesArr[number])")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(ContentView.colors[number])
                        .cornerRadius(10)
                }
            }
            
            if roundDone {
                VStack(alignment: .center) {
                    Text("You selected \(youPlayed), and your opponent chose \(computerPlayed)")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.mint)
                        .cornerRadius(10)

                    if computerPlayed == youPlayed {
                        Text("NO Winners!")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .cornerRadius(10)
                        
                        Image(systemName: "flag.2.crossed")
                            .font(.system(size: 100))
                            .padding()
                            .foregroundStyle(.indigo)
                    }
                    else if computerPlayed == winningMove {
                        Text("Computer wins")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.cyan)
                            .cornerRadius(10)
                        
                        Image(systemName: "eyes.inverse")
                            .font(.system(size: 100))
                            .padding()
                            .foregroundStyle(.purple)
                    }
                    else {
                        Text("You win!")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(.pink)
                            .cornerRadius(10)
                        
                        Image(systemName: "face.smiling")
                            .font(.system(size: 100))
                            .padding()
                            .foregroundStyle(.orange)
                    }
                }
            }
            
            Spacer()

            if (movesDone > 0) && !isAccomplished {
                Text("Your score for now is \(score)")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.teal)
                    .cornerRadius(10)
            }
            
            if isAccomplished {
                VStack {
                    Button("Reset", action: reset)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.yellow)
                        .font(.title)
                        .cornerRadius(10)
                      
                    Text("Your final score is \(score)")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }

    func moveDone(_ number: Int){
        yourMove = number
        youPlayed = ContentView.movesArr[number]
        computerPlayed = ContentView.movesArr[computerMove]
        winningMove = ContentView.winningMoves[number]
        roundDone = true

        if computerPlayed == youPlayed || computerPlayed == winningMove {}

        else {
            score += 1
        }
        
        computerMove = Int.random(in: 0...2)
       
        if movesDone < 10 {
            movesDone += 1
        }
        else {
            isAccomplished = true
        }
    }
    
    func reset(){
        isAccomplished = false
        score = 0
        movesDone = 0
    }
}

#Preview {
    ContentView()
}
