//
//  LoginView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack
        {
            VStack {
                Spacer()
                Image("ic_app_threads")
                    .resizable()
                    .frame(width: 120, height: 120)
                VStack
                {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    SecureField("Enter your password", text: $viewModel.password)
                            .modifier(ThreadsTextFieldModifier())

                }
                .padding()
                NavigationLink
                {
                    Text("Forgot Password?")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment:.trailing)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                }
                Button(action: {
                    Task{ try await viewModel.loginUser()}
                }, label: {
                    Text("Login")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        .padding()

                })
                Spacer()
                Divider()
                NavigationLink(destination: RegistrationView()
                    .navigationBarBackButtonHidden()
                ) {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text(" Sign Up")
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
