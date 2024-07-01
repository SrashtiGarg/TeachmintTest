//
//  ActivityIndicatorView.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import SwiftUI

struct ActivityIndicatorView: View {
    var text: String
    @Binding var isLoading: Bool

    var body: some View {
        GeometryReader{ geometry in
            HStack(alignment: .center) {
                if isLoading {
                    ProgressView()
                        .foregroundColor(Color.black)
                        .tint(Color.black)
                    Text(text)
                        .foregroundColor(Color.black)
                }else{
                    EmptyView()
                }
            }.frame(width: geometry.size.width,
                    height: geometry.size.height )
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
            .ignoresSafeArea()
        ActivityIndicatorView(text: "Logging in…", isLoading: .constant(true))
            .background(Color.white)
    }
    
}
