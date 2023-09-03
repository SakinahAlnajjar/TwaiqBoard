
//
//  LoginView.swift
//  FinalProject
//
//  Created by سكينه النجار on 30/08/2023.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @State var email : String = ""
    @State var name  : String = ""
    @State var password : String = ""
    @State var showNextPage: Bool = false
    @State var showAlert: Bool = false
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        // NavigationView {
        if showNextPage == true {
            Text("new page")
        } else {
            VStack{
                Image("board")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack{
                    TextField("Emaill Adress" ,text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    SecureField("Password " ,text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    Button {
                        guard !email.isEmpty, !password.isEmpty  else {
                            return
                            
                        }
                        viewModel.signIn(email: email, password: password)
                    } label: {
                        Text("SignIn")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color(red:0.3608, green: 0.2157, blue: 0.5882))
                        
                    }
                    NavigationLink("create Account" , destination: RegisterView().environmentObject(viewModel))
                        .padding()
                }
            }
            .padding()
            Spacer()
         // aleart
            .navigationTitle("Sign In")
    }
    }
}
struct LoginView_Previews: PreviewProvider {
  // @ObservedObject var viewModel = AppViewModel()

    static var previews: some View {
     LoginView()
    .environmentObject(AppViewModel())
    }
}
