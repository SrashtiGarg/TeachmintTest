//
//  RepoDetailView.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import SwiftUI

struct RepoDetailView: View {
    
    @Binding var getSearchData : Items
    @Environment(\.dismiss) var dismiss
    @State var showWebView = false
    @State var isOffline = false
    
    var body: some View {
        ScrollView{
            VStack{
                headerData()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 2)
                            
                        )
                    VStack() {
                        loadAvatarImage()
                        loadRepoName()
                        loadRepoDesc()
                        loadRepoLink()
                        loadRepoContributorUrl()
                    }.padding()
                    
                }
                
            }.onAppear{
                
            }
        }.padding()
    }
}

