//
//  ContentView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else if isLoggedIn {
                    BlankPageView()
                } else {
                    LoginPage(isLoggedIn: $isLoggedIn)
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false 
                }
            }
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


