
//  RegisterView.swift
//  FinalProject
//
//  Created by سكينه النجار on 30/08/2023.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var email : String = ""
    @State var  password : String = ""
    @State var  repassword : String = ""
    @State var name  : String = ""
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        VStack {
            TextField("Enter Full name" ,text: $name)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.black)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            TextField("Email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            SecureField("password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            SecureField("Repassword", text: $repassword)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.blue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

//            if password != repassword
//            {
//                Text("Not Equal")
//                    .padding()
//            }
                Button {
                    guard !name.isEmpty, !email.isEmpty, !password.isEmpty , password == repassword else {
                        return
                    }
                    viewModel.signUp(email: email, password: password)
//                    viewModel.signUp(name: name ,email : email , password : password , repassword: repassword)
//
            } label: {
                Text("Sign Up / Create Acoount")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(.blue)
            }
        }
        .padding()
        Spacer()
            .navigationTitle("Create acoount")
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
