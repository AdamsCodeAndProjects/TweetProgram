//
//  ProfilePhotoSelectorView.swift
//  TweetProject
//
//  Created by adam janusewski on 7/22/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?  // from UIKit
    @State private var profileImage : Image?  // SwiftUI
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Bring it.",
                                     title2: "Add a profile photo.")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "square.and.arrow.up.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            Spacer()
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Select this image")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 280, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .shadow(color: .black, radius: 7, x: 7, y: 7)
                        .padding()
                }
            }
            
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)  // Select Image from UIKit image
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
