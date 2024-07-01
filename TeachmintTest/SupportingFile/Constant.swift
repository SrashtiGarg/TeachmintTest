//
//  Constant.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation

let finalDataCount = 15
enum HttpMethodType : String {
    case get = "GET"
    case post = "POST"
}

class ApiUrl{
    
    //Define All Api Base Url
    static let baseUrl = "https://api.github.com/"
}

class Constant{
    static let items = "items"
    static let avatarUrl = "avatarUrl"
    static let fullName = "fullName"
    static let owner = "owner"
    static let contributorsUrl = "contributorsUrl"
    static let projectLink = "projectLink"
    static let description = "description"
}
