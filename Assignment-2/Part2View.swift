//
//  Part2View.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct Part2View: View {
    @State private var showExit = false
    @State private var showSettings = false
    @State private var email = "daniel@gmail.com"
    @State private var schoolEmail = "daniel@myseneca.ca"
    @State private var collegeName = "Seneca College"
    @State private var password = "password123"
    @State private var showSaveConfirmation = false
    @State private var showPassword = false
    @State private var notifications = true
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Button{
                        showExit = true
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                        
                        Text("Profile")
                            .foregroundStyle(.black)
                    }
                    .alert("Exit", isPresented: $showExit){
                        Button("Exit") {}
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Are you sure you want to exit?")
                    }
                    
                    Spacer()
                    
                    Button{
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(.black)
                    }
                    .alert("Settings Page", isPresented: $showSettings){} message: {Text("Settings page coming soon!")}
                }
            }
            .padding()
            
            VStack(spacing: 15){
                Image("profileimage")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .overlay(
                        Circle().stroke(.white, lineWidth: 3)
                    )
                Text("Daniel Potter")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Music Sorcerer")
                    .font(.title3)
                    .italic()
                
            }
            
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Text("Email")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack{
                    TextField("Enter your email", text: $email)
                        .font(.title3)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .border(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                    Image(systemName: "envelope.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                HStack(alignment: .top){
                    Text("School Email")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack{
                    TextField("Enter your School Email", text: $schoolEmail)
                        .font(.title3)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .border(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                    Image(systemName: "envelope.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                HStack(alignment: .top){
                    Text("College")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack{
                    TextField("Enter your college name", text: $collegeName)
                        .font(.title3)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .border(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                    Image(systemName: "graduationcap.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                HStack(alignment: .top){
                    Text("Password")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack{
                    if showPassword {
                        TextField("Enter your password", text: $password)
                            .font(.title3)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .border(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray6))
                            )
                    } else {
                        SecureField("Enter your password", text: $password)
                            .font(.title3)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .border(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray6))
                            )
                    }
                    
                    Image(systemName: "lock.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    if showPassword{
                        Text("Hide password")
                    }else{
                        Text("Show password")
                    }
                }
                
                Toggle("Receive Email Updates", isOn: $notifications)
                    .tint(.yellow)
                    .font(.title2)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .border(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                    )
                    .padding(.bottom, 10)
                
                HStack{
                    Button{
                        showSaveConfirmation = true
                    }label: {
                        Text("Save Profile")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(disableSaveProfile ? Color(.systemGray) : .blue)
                            )
                            .foregroundStyle(.white)
                    }
                    .disabled(disableSaveProfile)
                    .alert("Profile Saved", isPresented: $showSaveConfirmation){} message: {Text("Profile Saved!")}
                }
            }
            .padding()
            .padding(.bottom, 25)
            .background(Color(.systemGray2))
        }
        .background(Color(.systemGray))
    }
    
    private var isCorrectEmail: Bool{
        return email.contains("@") && email.contains(".") && schoolEmail.contains("@") && schoolEmail.contains(".")
    }
    
    private var disableSaveProfile : Bool{
        return !(isCorrectEmail && !collegeName.isEmpty && !password.isEmpty)
    }
}

#Preview {
    Part2View()
}
