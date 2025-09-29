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
            
            ProfileInfoView()
        }
        Spacer()
    }
}

#Preview {
    HomepageView()
}
