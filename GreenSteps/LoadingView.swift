//
//  LoadingView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        VStack {
            if isLoading {
                ZStack {
                    Image("lo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .padding()

                    VStack {
                        Spacer()

                        Text("Power by")
                            .foregroundColor(.gray)
                            .font(.headline)

                        Text("GreenSteps")
                            .foregroundColor(Color.green.opacity(0.7))
                            .font(.headline)
                            .padding(.bottom, 20)
                    }
                }
            } else {
                InPageView()
            }
        }
    }
}








