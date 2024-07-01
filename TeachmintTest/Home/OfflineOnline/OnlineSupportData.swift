//
//  OnlineSupportData.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import CoreData
import SwiftUI

class OnlineSupportData{
    
    func saveOnlineData(items: [Items], context: NSManagedObjectContext){
        for i in 0..<15 {
            let model : Items = items[i]
            let newItem = Item(context: context)
            newItem.contributerLink = model.contributorsUrl
            newItem.projectLink = model.projectLink
            newItem.repoImage = model.owner?.avatarUrl ?? ""
            newItem.repoDesc = model.description
            newItem.repoName = model.fullName
        }
    }
    
    func savingOfflineDataToMainArray(items: FetchedResults<Item>) -> (HomeModel, Bool){
        if !Reachability.isConnectedToNetwork(){
            var itemMod = [Items]()
            for data in items {
                let ownerModel = Owner(avatarUrl: data.repoImage)
                let itemModel : Items = Items(fullName: data.repoName, owner: ownerModel, contributorsUrl: data.contributerLink, projectLink: data.projectLink, description: data.repoDesc)
                itemMod.append(itemModel)
            }
            let model : HomeModel = HomeModel(items: itemMod)
            return(model, true)
        }else{
            return(HomeModel(), false)
        }
    }
}
