//
//  Request.swift
//  SpotifyCloneB
//
//  Created by Linder Anderson Hassinger Solano    on 7/05/22.
//

import Foundation

class Request {
    
    let token = "    BQCKZCR36r3g-er8LazthfodmEZYvFgq3ptlI09wzfqaETlIGHN38DeGqOzZR-PhPeXVsubF_pSJD1zWvYdYRB4SOgh0IvwWHnicpRY0PwGom3jP_l8scx8jCrzGde1ru8z-HourqqQo1lcJlFkr4GwP-H8X2IhBASKSCdSNcZtge-xXnJhZgkP60khIF3gPAeAZQ8EORfb9Gmo0eF8"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data? {
        do {
            let urlParse = url.replacingOccurrences(of: " ", with: "%20")
            var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(urlParse)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        } catch {
            return nil
        }
    }
    
}
