//
//  ContentView.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    //MARK: - Variable Declaration
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.contributerLink, ascending: true),                    NSSortDescriptor(keyPath: \Item.projectLink, ascending: true),
                          NSSortDescriptor(keyPath: \Item.repoDesc, ascending: true),
                          NSSortDescriptor(keyPath: \Item.repoImage, ascending: true),
                          NSSortDescriptor(keyPath: \Item.repoName, ascending: true)],
        animation: .default)
    var items: FetchedResults<Item>
    
    var viewModel = HomeViewModel()
    var offlineObj = OfflineSupportData()
    var onlineObj = OnlineSupportData()
    
    @State var activityText: String = ""
    @State var itemModel : Items = Items()
    @State var isPresentingDestination = false
    @State var isSearching = false
    @State var isLoading = false
    @State var searchText = ""
    @State var isDataFound: Bool = false
    @State var totalPages = 10
    @State var page : Int = 10
    
    
    //MARK: - Body of View
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    
                    showHeaderWithSearchBar()
                    
                    showListData()
                    
                    showProgressInBottomList()
                    
                }.onAppear{
                    gettingOnlineOfflineData()
                    
                }.onAppear(perform: loadMoreData)
                
            }.padding()
            
            showProgressBar()
            
        }
        
    }
    
    
    func addLocalDataItem() {
        withAnimation {
            
            Reachability.isConnectedToNetwork() ? onlineObj.saveOnlineData(items: viewModel.getAllRepo.items ?? [], context: viewContext) : offlineObj.saveOfflineData(context: viewContext)
            
            do {
                try viewContext.save()
                (viewModel.getAllRepo, isDataFound) = onlineObj.savingOfflineDataToMainArray(items: items)
                
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

