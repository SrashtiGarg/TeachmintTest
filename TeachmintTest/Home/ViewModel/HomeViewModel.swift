//
//  SearchViewModel.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import UIKit
import SwiftUI

class HomeViewModel{
    var repoData = [Items]()
    var getAllRepo = HomeModel()
    var isPaginate = false
    @State var isCompleteApi = true
    
    //MARK: - Get data from API
    func callWallApi(page:Int, completion: @escaping(_ status: Bool) -> Void){
        var request = URLRequest(url: URL(string: "\(ApiUrl.baseUrl)search/repositories?q=Q&per_page=\(page)")!)
        
        request.httpMethod = HttpMethodType.get.rawValue

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(HomeModel.self, from: data!)
                self.getAllRepo = responseModel
                //self.repoData.append(contentsOf: self.getAllRepo.items!)
                completion(true)
            } catch {
                completion(false)
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    
    //MARK: - Filter data for making search
    func filteredItems(searchText: String) -> [Items] {
        if searchText.isEmpty {
            return getAllRepo.items ?? []
        } else {
            return getAllRepo.items!.filter { $0.fullName!.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
}

