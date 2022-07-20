//
//  FeedView.swift
//  TweetProject
//
//  Created by adam janusewski on 7/20/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweet = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.tweets) { tweet in
                        TweetsRowView(tweet: tweet)
                    }
                }
            }
            Button {
                showNewTweet.toggle()
            } label: {
                Image(systemName: "pawprint.circle")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 40, height: 40)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweet) {
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
