//
//  HomeExtensionFile.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import UIKit
import SwiftUI

extension HomeView {
    
    //MARK: - Header with Search bar
    func showHeaderWithSearchBar() -> some View {
        LazyVStack{
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            if Reachability.isConnectedToNetwork(){
                SearchBar(searchText: $searchText, isSearching: $isSearching)
            }
        }
    }
    
    //MARK: - Update List Data
    func showListData() -> some View {
        LazyVStack{
            if isDataFound {
                ForEach(viewModel.filteredItems(searchText: searchText).indices, id: \.self) { index in
                    let model : Items = viewModel.filteredItems(searchText: searchText)[index]
                    Button {
                        itemModel = model
                        isPresentingDestination = true
                    } label: {
                        CardView(title: model.fullName ?? "", description: model.description ?? "")
                    }.onAppear{
                        if Reachability.isConnectedToNetwork(){
                            loadMoreContent(currentItem: index)
                        }
                        
                    }
                    
                    .fullScreenCover(isPresented: $isPresentingDestination) {
                        RepoDetailView(getSearchData: $itemModel)
                    }
                }
            }
        }
    }
    
    //MARK: - Data updated onAppear
    func gettingOnlineOfflineData(){
        if Reachability.isConnectedToNetwork(){
            isLoading = true
            viewModel.callWallApi(page: page) { status in
                isLoading = false
                if status {
                    isDataFound = true
                    viewModel.isCompleteApi = true
                }else{
                    isDataFound = false
                    viewModel.isCompleteApi = false
                }
            }
            
            print("Internet Connection Available!")
        }else{
            if items.count > 0 {
                var itemMod = [Items]()
                for data in items {
                    let ownerModel = Owner(avatarUrl: data.repoImage)
                    let itemModel : Items = Items(fullName: data.repoName, owner: ownerModel, contributorsUrl: data.contributerLink, projectLink: data.projectLink, description: data.repoDesc)
                    itemMod.append(itemModel)
                }
                let model : HomeModel = HomeModel(items: itemMod)
                viewModel.getAllRepo = model
                isDataFound = true
            }else{
                addLocalDataItem()
            }
            print("Internet Connection not Available!")
        }
    }
    
    //MARK: - For Pagination
    func loadMoreContent(currentItem indexVal: Int){
        if indexVal == totalPages - 1 {
            page += 10
            totalPages += 10
            viewModel.callWallApi(page: page) { status in
                isDataFound = false
                if status {
                    isLoading = false
                    isDataFound = true
                    viewModel.isCompleteApi = true
                }else{
                    isLoading = false
                    isDataFound = false
                    viewModel.isCompleteApi = false
                }
            }
        }
    }
    
    func loadMoreData() {
        if Reachability.isConnectedToNetwork(){
            let threshold = 5 // Adjust as needed, e.g., distance from bottom
            let currentOffset = CGFloat(viewModel.getAllRepo.items?.count ?? 0)
            let contentHeight = UIScreen.main.bounds.height - 200 // Adjust as needed, e.g., footer height
            
            if currentOffset > contentHeight - UIScreen.main.bounds.height + CGFloat(threshold) {
                if !viewModel.isPaginate {
                    viewModel.isPaginate = true
                }
            }
        }
    }
    
    func showProgressBar() -> some View{
        ZStack{
            ActivityIndicatorView(text: "Loading…", isLoading: $isLoading)
                .frame(height: 20)
                .padding(.top, 15)
            
            if !viewModel.isCompleteApi{
                VStack{
                    Image("NoDataFound")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Please try again")
                    
                }
            }
        }
    }
    
    func showProgressInBottomList() -> some View {
        LazyVStack{
            if viewModel.isPaginate && Reachability.isConnectedToNetwork() && !isSearching{
                ActivityIndicatorView(text: "", isLoading: .constant(true))
                    .frame(height: 20)
                    .padding(.top, 15)
            }
        }
    }
}
