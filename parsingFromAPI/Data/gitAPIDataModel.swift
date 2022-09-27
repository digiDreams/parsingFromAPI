//
//  gitAPIDataModel.swift
//  parsingFromAPI
//
//  Created by Apprenant 16 on 27/09/2022.
//

import Foundation
import SwiftUI

struct GetGitUser: Decodable {
    var login: String // nom
    var avatar_url: String // image
    var public_repos: Int? // nb de repos
//    var user_url: String //+ userName
}




func getGitUserProfile(userName: String) async throws -> (GetGitUser) {
    guard let url = URL(string: "https://api.github.com/users/\(userName)")
    else {
        fatalError("Missing URL")
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    guard (response as? HTTPURLResponse)?.statusCode == 200
    else {
        fatalError("Error while fetching data")
    }
    let decoded = try JSONDecoder().decode(GetGitUser.self, from: data)
    return decoded
    
}
