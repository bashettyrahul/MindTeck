//
//  MindTeckApp.swift
//  MindTeck
//
//  Created by Rahul Bashetty on 09/08/24.
//

import SwiftUI

@main
struct MindTeckApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
