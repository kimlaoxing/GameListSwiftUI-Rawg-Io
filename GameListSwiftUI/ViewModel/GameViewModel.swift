import Foundation
import SwiftUI

class GameViewModel: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let rating: String
    let released: String
    let backgroundImage: String?
    @Published var gambar: Image?
    
    
    init(game: GameList) {
        self.id = game.id
        self.name = game.name
        self.rating = String(format: "%.2f", game.rating)
        self.released = game.released
        self.backgroundImage = game.backgroundImage
    }
}
