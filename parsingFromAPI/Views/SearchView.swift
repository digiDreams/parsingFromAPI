//
//  SearchView.swift
//  parsingFromAPI
//
//  Created by Apprenant 16 on 27/09/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String
    @State var user = GetGitUser(login: "", avatar_url: "", public_repos: 0)
    var body: some View {
        NavigationView{
            VStack{
                Text("")
                    .searchable(text: $searchText)
                
                AsyncImage(url: URL(string: user.avatar_url))
//                    .frame(maxWidth: 200, maxHeight: 200)
                Text(user.login)
                    .bold()
                HStack {
                    Text(String(user.public_repos))
                    Text("repositories à ce jour")
                }
                
                Button {
                    
                    Task {
                        do {
                            user = try await getGitUserProfile(userName: searchText)
                        } catch {
                            print("Error", error)
                        }
                    }
                    //                    try await getGitUserProfile()
                } label: {
                    Text("Afficher le profil")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
          
            }
            .navigationTitle("Find Git User")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "sjkfhskf", user: GetGitUser(login: "", avatar_url: "", public_repos: 0))
    }
}
