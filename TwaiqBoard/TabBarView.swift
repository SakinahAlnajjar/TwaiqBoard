//
//  TabBarView.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        if viewModel.isSiginIn {
            TabView {
                Text("Home")
                    .tabItem {
                        Label("Home", systemImage: "list.dash")
                    }
                
                Text("My courses")
                    .tabItem {
                        Label("My courses", systemImage: "square.and.pencil")
                    }
            }
            .onAppear{
                viewModel.signIn = viewModel.isSiginIn
            }
        } else {
            LoginView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
