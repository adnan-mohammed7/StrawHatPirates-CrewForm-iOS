//
//  Part1View.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct Part1View: View {
    @State private var name = ""
    @State private var email = ""
    @State private var bountyId = ""
    @State private var secretPower = ""
    @State private var confirmPower = ""
    @State private var joinStrawHats = false
    @State private var treasureUpdates = true
    @State private var bountyValue = 50000000.0
    @State private var showPopup = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5){
                Text("⛵️")
                    .font(.system(size: 60))
                    .padding(.bottom, 5)
                
                Text("Straw Hat Pirates")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Join the crew")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                
                Text("\"I'm gonna be King of the Pirates\"")
                    .italic()
                    .foregroundStyle(Color(.red))
                    .padding(.top, 5)
                
                VStack{
                    HStack{
                        Text("Personal Info")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    VStack(spacing: 10){
                        VStack(){
                            HStack{
                                Text("👑")
                                    .font(.system(size: 16))
                                Text("Pirate Name")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Spacer()
                                if !name.isEmpty{
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                            
                            TextField("What's your dream name?", text: $name)
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.vertical, 13)
                                .autocorrectionDisabled()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(.systemGray6))
                                )
                        }
                        .padding(.top, 07)
                        
                        VStack(){
                            HStack{
                                Text("📞")
                                    .font(.system(size: 16))
                                Text("Den Den Mushi")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Spacer()
                                
                                if(!email.isEmpty){
                                    if(isEmailCorrect){
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(.green)
                                    }else{
                                        Image(systemName: "exclamationmark.circle.fill")
                                            .foregroundStyle(.red)
                                    }
                                }
                            }
                            
                            TextField("contact@grandline.sea", text: $email)
                                .autocorrectionDisabled()
                                .keyboardType(.emailAddress)
                                .textContentType(.emailAddress)
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.vertical, 13)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(.systemGray6))
                                )
                                .autocapitalization(.none)
                            
                            if (!email.isEmpty && !isEmailCorrect){
                                HStack{
                                    Text("Invalid email format")
                                        .font(.caption)
                                        .foregroundStyle(.red)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 07)
                        
                        VStack(){
                            HStack{
                                Text("⭐️")
                                    .font(.system(size: 16))
                                Text("Bounty ID")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Spacer()
                                if(!bountyId.isEmpty){
                                    if(bountyId.count > 2 && bountyId.count <= 20){
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(.green)
                                    }else{
                                        Image(systemName: "exclamationmark.circle.fill")
                                            .foregroundStyle(.red)
                                    }
                                }
                            }
                            
                            TextField("Your wanted poster name", text: $bountyId)
                                .font(.subheadline)
                                .autocorrectionDisabled()
                                .padding(.horizontal)
                                .padding(.vertical, 13)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(.systemGray6))
                                )
                            
                            if(!bountyId.isEmpty){
                                HStack{
                                    Text("\(bountyId.count)/20 characters")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(bountyId.count <= 20 ? Color(.gray) : Color(.red))
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top, 07)
                    }
                }
                .padding()
            }
            
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
                                .foregroundStyle(Color(.red))
                            Spacer()
                        }
                    }
                }
                .padding(.top, 07)
            }
            .padding()
            
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
                        Text("\(bountyDisplay)M฿")
                            .monospacedDigit()
                            .fontWeight(.semibold)
                            .foregroundStyle(.yellow)
                            .font(.system(size: 20))
                    }
                    .padding(.top, 10)
                    
                    Slider(value: $bountyValue, in: 10000000...500000000, step: 1)
                        .tint(.yellow)
                    
                }
                .onChange(of: bountyValue) {
                    bountyValue = max(50000000, bountyValue)
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
            
            Button(){
                showPopup = true
            } label: {
                HStack{
                    Text("⛵️")
                    Text("Set Sail")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Text("🏴‍☠️")
                }
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(disableSubmitBtn ? Color(.systemGray6) : Color.customRed)
                )
            }
            .padding(.horizontal, 20)
            .disabled(disableSubmitBtn)
            .alert("Welcome to the Crew! 🎉", isPresented: $showPopup) {
                Button("Start Adventure") {
                    name = ""
                    email = ""
                    bountyId = ""
                    secretPower = ""
                    confirmPower = ""
                    joinStrawHats = false
                    treasureUpdates = true
                    bountyValue = 50
                }
                Button("Stay Here", role: .cancel) {}
            } message: {
                Text("You're now a Straw Hat Pirate with a \(Int(bountyValue)) berry bounty!")
            }
            
            if(disableSubmitBtn){
                Text("Complete all fields to join the crew")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                    .padding()
            }
        }
        Spacer()
    }
    
    var isEmailCorrect: Bool{
        return email.contains("@") && email.contains(".")
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
    
    var disableSubmitBtn : Bool {
        return !(isEmailCorrect && !name.isEmpty && !bountyId.isEmpty && bountyId.count >= 3 && !secretPower.isEmpty && !confirmPower.isEmpty && confirmPower == secretPower)
    }
    
    private var bountyInHundreds: Double {
        return bountyValue / 1_000_000
    }
    
    private var bountyDisplay: String {
        if bountyInHundreds < 100 {
            return String(format: "%.1f", bountyInHundreds)
        } else {
            return String(format: "%.0f", bountyInHundreds)
        }
    }
}

extension Color {
    static let customRed = Color( red: 225.0/255.0, green: 63.0/255.0, blue: 63.0/255.0)
}

#Preview {
    Part1View()
}
