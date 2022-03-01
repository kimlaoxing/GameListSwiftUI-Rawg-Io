import Foundation
import Combine


class GameListViewModel: ObservableObject {
    @Published public private(set) var games: [GameViewModel] = []
    
    private let dataModel: apiService = apiService()
    private let gambarLoader: apiService = apiService()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        loadGames()
    }
    
    private func loadGames(){
        games.removeAll()
        gambarLoader.reset()
        dataModel.loadGames(){ games in
            games.forEach {
                self.appendGame(game: $0)
            }
        }
    }
    
    private func appendGame(game: GameList) {
        let gameViewModel = GameViewModel(game: game)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ) {
            self.games.append(gameViewModel)
        }
        
        gambarLoader.loadGambar(forGame: game) { image in
            DispatchQueue.main.async {
                gameViewModel.gambar = image
            }
        }
        
    }
}
