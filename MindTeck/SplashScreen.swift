//
//  SplashScreen.swift
//  MindTeck
//
//  Created by Rahul Bashetty on 09/08/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Image("indiaSplashScreen")
                    .resizable()
//                    .frame()
                    .foregroundColor(.white)
                
                Text("MindTeck")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
