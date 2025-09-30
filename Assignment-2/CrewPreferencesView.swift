//
//  CrewPreferencesView.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct CrewPreferencesView: View {
    @State private var joinStrawHats = false
    @State private var treasureUpdates = true
    @State private var bountyValue = 50.0
    
    var body: some View {
        VStack{
            HStack{
                Text("Crew Preferences")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            VStack(spacing: 10){
                
                    HStack{
                        Text("💖")
                            .font(.system(size: 20))
                        VStack(alignment: .leading, spacing: 5){
                            Text("Join Straw Hats Forever")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            
                            Text("Loyalty to Luffy & crew")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Toggle("", isOn: $joinStrawHats)
                            .tint(.yellow)
                        
                    }
            
            HStack{
                Text("🗺️")
                    .font(.system(size: 20))
                VStack(alignment: .leading, spacing: 5){
                    Text("Treasure Updates")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    
                    Text("Adventure notifications")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Spacer()
                Toggle("", isOn: $treasureUpdates)
                    .tint(.yellow)
            }
            
            HStack(){
                VStack(alignment: .leading, spacing: 5){
                    Text("Starting Bounty")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    
                    Text("Set your initial reward")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text("\(Int(bountyValue)).0M฿")
                    .monospacedDigit()
                    .fontWeight(.semibold)
                    .foregroundStyle(.yellow)
                    .font(.system(size: 20))
            }
            .padding(.top, 10)
                
            Slider(value: $bountyValue, in: 0...500, step: 1)
                .tint(.yellow)
                
            }
            .onChange(of: bountyValue) {
                    bountyValue = max(50, bountyValue)
            }
            
            HStack(alignment: .top){
                Text("50M฿")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text("500M฿")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
                
        }
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    CrewPreferencesView()
}
