//
//  SearchBar.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search ...", text: $searchText)
                .padding(.leading, 24)
                .padding(.vertical, 12)
                .padding(.trailing, 8)
                .background(Color(.systemGray5))
                .cornerRadius(8)

            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor((searchText.isEmpty) ? Color(.systemGray5) : Color(.systemBlue))
            }
            .padding(.trailing, 8)
            .padding(.vertical, 12)
            .disabled(searchText.isEmpty)
            .cornerRadius(8)
        }
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}


