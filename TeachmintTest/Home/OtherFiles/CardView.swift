//
//  CardView.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top){
                Text("Repo Name:")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text(title)
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            HStack(alignment: .top){
                Text("Repo Desc:")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        
    }
}
