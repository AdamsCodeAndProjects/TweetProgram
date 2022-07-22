//
//  AuthenticationHeaderView.swift
//  TweetProject
//
//  Created by adam janusewski on 7/22/22.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
                
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(Color.white)
        .clipShape(RoundedShape(corners: [.bottomRight])) // Rounds the right edge.  Need the RoundedShape struct
        .shadow(color: .black, radius: 7, x: 7, y: 7)
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back.")
    }
}
