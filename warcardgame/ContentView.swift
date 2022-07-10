//
//  ContentView.swift
//  warcardgame
//
//  Created by Logan Kells on 7/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background (green gradient)
            Image("background")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
                
            
            // Content
            VStack{
                Spacer()
                
                // Game logo
                Image("logo")
                
                Spacer()
                
                // Player card views
                HStack{
                    Spacer()
                    Image("card3")
                    Spacer()
                    Image("card4")
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Image("dealbutton")
                
                Spacer()
                
                // Player Score
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 10.0)
                        Text("0")
                            .font(.largeTitle)
                            .padding(.all)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 10.0)
                        Text("0")
                            .font(.largeTitle)
                            .padding(.all)
                    }
                    
                    Spacer()
                }.foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
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
