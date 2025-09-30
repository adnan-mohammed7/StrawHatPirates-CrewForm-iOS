//
//  DevilFruitPowersView.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct DevilFruitPowersView: View {
    @State private var secretPower = ""
    @State private var confirmPower = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Devil Fruit Powers")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            VStack(spacing: 10){
                
                VStack(){
                    HStack{
                        Text("🔥")
                            .font(.system(size: 16))
                        Text("Secret Power")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Spacer()
                        if(!secretPower.isEmpty){
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                    
                    SecureField("Your hidden ability", text: $secretPower)
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 13)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                    
                    if(!secretPower.isEmpty){
                        HStack{
                            Text(powerLevel)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(confirmPower.count <= 20 ? Color(.gray) : Color(.red))
                            Spacer()
                        }
                    }
                }
                .padding(.top, 07)
            }
            
            VStack(){
                HStack{
                    Text("✅")
                        .font(.system(size: 16))
                    Text("Confirm Power")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Spacer()
                    if(!confirmPower.isEmpty){
                        if(confirmPower == secretPower){
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }else{
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                }
                
                SecureField("Confirm your ability", text: $confirmPower)
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.vertical, 13)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                    )
                
                if(!confirmPower.isEmpty && confirmPower != secretPower){
                    HStack{
                        Text("Powers don't match")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(confirmPower.count <= 20 ? Color(.gray) : Color(.red))
                        Spacer()
                    }
                }
            }
            .padding(.top, 07)
        }
        .padding()
        
        Spacer()
        
    }
    
    var powerLevel : String {
        if(secretPower.count > 0 && secretPower.count <= 5){
            return "East Blue Level"
        }else if(secretPower.count >= 6 && secretPower.count <= 9){
            return "Grand Line Level"
        }else if(secretPower.count >= 10){
            return "New World Level"
        }
        return ""
    }
    
}

#Preview {
    DevilFruitPowersView()
}
