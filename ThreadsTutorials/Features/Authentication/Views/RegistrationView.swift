//
//  RegistrationView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            Image("ic_app_threads")
                .resizable()
                .frame(width: 120, height: 120)
                .padding()
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())

                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your fullname", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())

            }.padding()

            Button(action: {
                Task {try await viewModel.createUser()}
            }, label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(8)
                    .padding()

            })
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {

                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text(" Sign in")
                }
                .foregroundColor(.black)
                .font(.footnote)
            }.padding(.vertical, 16)

            }
        }
    }

#Preview {
    RegistrationView()
}
