//
//  HomepageView.swift
//  Assignment-2
//
//  Created by user278021 on 9/26/25.
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        VStack(spacing: 5){
            Image("ship")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text("Straw Hat Pirates")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Join the crew")
                .foregroundStyle(.gray)
                .font(.subheadline)
            
            Text("\"I'm gonna be King of the Pirates\"")
                .italic()
                .foregroundStyle(.red)
                .padding(.top, 5)
        }
        Spacer()
    }
}

#Preview {
    HomepageView()
}
