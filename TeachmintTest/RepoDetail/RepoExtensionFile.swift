//
//  RepoExtensionFile.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

extension RepoDetailView {
    
    func headerData() -> some View {
        HStack{
            Button(action: {
                dismiss()
            }, label: {
                Image("back")
            })
            Text("Repo Detail")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
        }
    }
    
    func loadRepoName() -> some View {
        HStack(alignment: .top){
            Text("Repo Name:")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.black)
                
            Text(getSearchData.fullName ?? "")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        
    }
    
    func loadAvatarImage() -> some View {
        AsyncImage(url: URL(string: getSearchData.owner?.avatarUrl ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView() // Placeholder while loading
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure(let error):
                Text("Failed to load image: \(error.localizedDescription)")
            @unknown default:
                Text("Unknown state")
            }
        }
        //.resizable()
        .scaledToFit()
        .frame(width: 150, height: 150) // Set your desired image size
        .clipShape(Circle()) // Clips the image into a circle shape
        .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Optional: add a border around the circle
        .shadow(radius: 7)
    }
    
    func loadRepoLink() -> some View {
        HStack(alignment: .top){
            Text("Repo Link:")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            Button(getSearchData.projectLink ?? "") {
                if Reachability.isConnectedToNetwork() {
                    self.showWebView.toggle()
                    isOffline = false
                }else{
                    isOffline = true
                }
            }
            .sheet(isPresented: $showWebView) {
                if Reachability.isConnectedToNetwork(){
                    WebView(url: URL(string: getSearchData.projectLink ?? "")!)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
            }
            .alert("Network not found", isPresented: $isOffline) {
                Button("OK", role: .cancel) {
                    isOffline = false
                }
            }
            Spacer()
        }
    }
    
    func loadRepoDesc() -> some View {
        HStack(alignment: .top){
            Text("Repo Desc:")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            Text(getSearchData.description ?? "")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
    
    func loadRepoContributorUrl() -> some View {
        HStack(alignment: .top){
            Text("Contributors Url:")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            Text(getSearchData.contributorsUrl ?? "")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
