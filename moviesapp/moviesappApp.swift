//
//  moviesappApp.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import SwiftUI

@main
struct moviesappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
