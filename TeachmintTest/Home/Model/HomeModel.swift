//
//  SearchModel.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
struct HomeModel: Codable {
    var items: [Items]?
}
extension HomeModel {
    init(_ dict: [String: Any]) {
        self.items = dict.getArrayValue(forkey: Constant.items) as? [Items]
    }
}

struct Owner: Codable {
    var avatarUrl : String?
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
extension Owner {
    init(_ dict: [String: Any]) {
        self.avatarUrl = dict.getStringValue(forkey: Constant.avatarUrl)
    }
}

struct Items: Codable {
    var fullName: String?
    var owner : Owner?
    var contributorsUrl: String?
    var projectLink: String?
    var description: String?
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
        case contributorsUrl = "contributors_url"
        case projectLink = "html_url"
        case description = "description"
    }
}
extension Items {
    init(_ dict: [String: Any]) {
        self.fullName = dict.getStringValue(forkey: Constant.fullName)
        self.owner = dict[Constant.owner] as? Owner
        self.contributorsUrl = dict.getStringValue(forkey: Constant.contributorsUrl)
        self.projectLink = dict.getStringValue(forkey: Constant.projectLink)
        self.description = dict.getStringValue(forkey: Constant.description)
    }
}
