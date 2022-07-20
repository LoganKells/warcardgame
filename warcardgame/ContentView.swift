//
//  ContentView.swift
//  warcardgame
//
//  Created by Logan Kells on 7/10/22.
//

import SwiftUI

struct ContentView: View {
    // State management in View, @State let's the system monitor changes in value
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    private let multiplier = 7
    @State private var playerScoreDir: Int = 1  // 1 allows score to increase, -1 decreases score by multiplier
    @State private var cpuScoreDir: Int = 1
    @State private var messageWinner: String = ""
    @State private var scoreSummary = ""
    @State private var userMessage: String = ""
    private let maxScore = 13
    
    var body: some View {
        
        ZStack {
            // Background (green gradient)
            Image("background")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
                
            
            // Content
            VStack{
                Group {
                    Spacer()
                    
                    // War Card Game logo
                    Image("logo")
                
                    // Display the winner of the game once a player reaches maxScore
                    Text(messageWinner)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.yellow)
                        .padding(.top)
                    
                    // Display a message prompting user to restart the game.
                    Text(userMessage)
                        
                }.foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                Spacer()
                    
                
                // Player card view and dealing
                Group {
                    HStack{
                        Spacer()
                        // Player
                        Image(playerCard)
                        Spacer()
                        // CPU
                        Image(cpuCard)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    // Button instance with closure (action)
                    Button(action: {
                        // Check for a winner and restart the game
                        if playerScore == maxScore {
                            // Player wins the game at 21
                            scoreSummary = String(playerScore) + " vs " + String(cpuScore)
                            messageWinner = "Player Wins! " + scoreSummary
                            userMessage = "Press Deal to restart the game."
                            playerScore = 0
                            cpuScore = 0
                        } else if cpuScore == maxScore {
                            // CPU wins the game at 21
                            scoreSummary = String(playerScore) + " vs " + String(cpuScore)
                            messageWinner = "CPU Wins! " + scoreSummary
                            userMessage = "Press Deal to restart the game."
                            playerScore = 0
                            cpuScore = 0
                        } else {
                            // Generate random numbers between card2 to card14
                            messageWinner = ""
                            userMessage = ""
                            let playerRand = Int.random(in: 2...14)
                            let cpuRand = Int.random(in: 2...14)
                            
                            // Update the cards
                            playerCard = "card" + String(playerRand)
                            cpuCard = "card" + String(cpuRand)
                            
                            // Update the score
                            if playerRand > cpuRand {
                                if playerScore + 1 > maxScore {
                                    playerScore -= 1 * multiplier
                                } else {
                                    playerScore += 1
                                }
                            } else if cpuRand > playerRand {
                                if cpuScore + 1 > maxScore {
                                    cpuScore -= 1 * multiplier
                                } else {
                                    messageWinner = ""
                                    cpuScore += 1
                                }
                            }
                        }
                        
                        
                        
                    }, label: {
                        Image("dealbutton")
                    })
                    
                    Spacer()
                    
                    // Player Score
                    HStack{
                        
                        Spacer()
                        
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.bottom, 10.0)
                            Text(String(playerScore))
                                .font(.largeTitle)
                                .padding(.all)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.bottom, 10.0)
                            Text(String(cpuScore))
                                .font(.largeTitle)
                                .padding(.all)
                        }
                        
                        Spacer()
                    }.foregroundColor(.white)
                }
                
                Spacer()
            }
        }
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
