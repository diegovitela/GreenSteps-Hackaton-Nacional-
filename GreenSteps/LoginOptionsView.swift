//
//  LoginOptionsView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import Foundation
import SwiftUI

struct LoginOptionsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Log in to your account")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.top, 70)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: true, vertical: false)
                .padding(20)

            NavigationLink(destination: BlankPageView()) {
                Text("Sign in with Google")
                    .foregroundColor(.black)
                    .frame(width: 280, height: 44)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .bold()
            }
            NavigationLink(destination: BlankPageView()) {
                Text("Sign in with Facebook")
                    .foregroundColor(.black)
                    .frame(width: 280, height: 44)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .bold()
            }
            NavigationLink(destination: BlankPageView()) {
                Text("Sign in as Guest")
                    .foregroundColor(.black)
                    .frame(width: 280, height: 44)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .bold()
            }

            Spacer()

            Text("By continuing, you agree to our Terms of Use and Privacy Policy.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
