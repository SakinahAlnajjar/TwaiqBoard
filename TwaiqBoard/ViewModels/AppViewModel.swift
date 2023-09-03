//
//  AppViewModel.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//


import Foundation
import FirebaseAuth

class AppViewModel : ObservableObject {
    @Published var signIn = false
    @Published var signUp = false
    @Published var showAlert: Bool = false
    @Published var showNextPage: Bool = false
    var isSiginIn : Bool {
        return Auth.auth().currentUser != nil
    }
    var isSiginUp : Bool {
        return Auth.auth().currentUser != nil
    }
    func signIn(email: String , password : String)
    {
        Auth.auth().signIn(withEmail: email, password: password)
        { result , error in
//            guard result != nil , error == nil else {
//                return
//            }
//            DispatchQueue.main.async {
//                self.signIn = true
//            }
                        if error != nil {
                            print(error!.localizedDescription)
//                            self.showAlert = true
                        }   else {
                            print(result!.description)
//                            self.showNextPage = true
                        }
        }
    }
    
    func signUp(email: String , password : String)
    {
        
        Auth.auth().createUser(withEmail: email, password: password)
        { result , error in
            guard result != nil , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.signUp = true
            }
            //            if error != nil {
            //                print(error!.localizedDescription)
            //                self.showAlert = true
            //            } else {
            //                print(result!.description)
            //                self.showNextPage = true
            //            }
            //        }
        }
    }
}
