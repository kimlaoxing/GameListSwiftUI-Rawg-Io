import Foundation
import SwiftUI

class GameDetailViewModel: Identifiable, ObservableObject {
    let id: Int
    let description: String
    let backroundImage: String?
    
    init(detail: GameDetail) {
        self.id = detail.id
        self.backroundImage = detail.backgroundImage
        self.description = detail.gameDetailDescription
        
        
    }
}
