//
//  HoroCompletionHandler.swift
//  App Team Production Demo
//
//  Created by Josh Myatt on 1/18/23.
//

import Foundation

struct HoroAsyncAwait {
    public func requestHoro(sign: String, day: String) async throws -> HoroResponse {
        let query = "https://aztro.sameerkumar.website?sign=\(sign)&day=\(day)"

        var request = URLRequest(url: URL(string: query)!)
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let parsedData = try JSONDecoder().decode(HoroResponse.self, from: data)
            return parsedData
        }
        catch {
            print(String(describing: error))
            fatalError()
        }
    }
}
