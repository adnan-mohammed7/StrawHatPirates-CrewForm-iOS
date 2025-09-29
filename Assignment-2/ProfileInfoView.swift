//
//  ProfileInfoView.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct ProfileInfoView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var bountyId = ""
    
    var body: some View {
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
                        .background(
                            RoundedRectangle(cornerRadius: 8)
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
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 13)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
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
                        .padding(.horizontal)
                        .padding(.vertical, 13)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
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
        
        Spacer()
    }
    
    var isEmailCorrect: Bool{
        return email.contains("@") && email.contains(".")
    }
}

#Preview {
    ProfileInfoView()
}
