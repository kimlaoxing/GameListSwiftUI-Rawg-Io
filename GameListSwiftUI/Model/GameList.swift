import Foundation

struct Games: Codable {
    let count: Int
    let next: String
    let results: [GameList]

    enum CodingKeys: String, CodingKey {
        case count, next, results
    }
}



struct GameList: Codable {
    let id: Int
    let slug, name, released: String

    let backgroundImage: String?
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
        
    }
}
