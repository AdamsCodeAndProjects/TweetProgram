//
//  UploadTweetViewModel.swift
//  TweetProject
//
//  Created by adam janusewski on 7/22/22.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweeet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                //dismiss view
                self.didUploadTweeet = true
            } else {
                //show error
            }
        }
    }
}
