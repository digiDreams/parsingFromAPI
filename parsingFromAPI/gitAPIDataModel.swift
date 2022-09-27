//
//  gitAPIDataModel.swift
//  parsingFromAPI
//
//  Created by Apprenant 16 on 27/09/2022.
//

import Foundation

struct getGitUser: Decodable {
    var user_url : String //+ userName
}

var userName: String = ""


func getGitUserProfile() async throws -> String {
    guard let url = URL(string: "https://api.github.com/users/{\(userName)}")
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
    let decoded = try JSONDecoder().decode(getGitUser.self, from: data)
    let userDisplay = decoded.user_url
    return userDisplay
    
}
