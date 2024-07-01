//
//  TeachmintTestApp.swift
//  TeachmintTest
//
//  Created by Srashti Garg on 01/07/24.
//

import SwiftUI

@main
struct TeachmintTestApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
