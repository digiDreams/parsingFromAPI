//
//  parsingFromAPIApp.swift
//  parsingFromAPI
//
//  Created by Apprenant 16 on 27/09/2022.
//

import SwiftUI

@main
struct parsingFromAPIApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(searchText: "", user: GetGitUser(login: "", avatar_url: "", public_repos: 0))
        }
    }
}
