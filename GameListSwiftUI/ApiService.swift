import Foundation
import SwiftUI

class apiService{
    private var dataTask: URLSessionDataTask?
    private var dataTaskx: URLSessionDataTask?
    private var dataTaskn: URLSessionDataTask?
    
    struct constants {
        static let key = "2899eeec0a734015a0227f5fc665e5e3"
        static let urlGames = "https://api.rawg.io/api/games"
        static let urlGambar = "https://media.rawg.io/media/screenshots/d33/d3353832a30b659bdf1dd1cc31cf72ed.jpg"
    }
    
    func loadGames(completion: @escaping(([GameList]) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(url: constants.urlGames) else {
         completion([])
            return
        }
        dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            if let gameResponse = try? JSONDecoder().decode(Games.self ,from: data){
                completion(gameResponse.results)
            }
        }
        dataTask?.resume()
    }
    
    func loadDetail(id: Int,completion: @escaping((GameDetail)-> Void)){
        dataTaskx?.cancel()
        guard let url = buildUrlDetail(url: constants.urlGames, id: id) else {
            return
        }

        dataTaskx = URLSession.shared.dataTask(with: url) { data, _, error in
          
            guard let data = data, error == nil else {
                return
            }
    
                if let detailResponse = try? JSONDecoder().decode(GameDetail.self, from: data) {
                    
                    completion(detailResponse)
                }
            
            
        }
        dataTaskx?.resume()
    }
    
    private var dataTasks: [URLSessionDataTask] = []
    private var dataTasksx: [URLSessionDataTask] = []
    private var dataTasksn: [URLSessionDataTask] = []
    
    func loadGambar(forGame game: GameList, completion: @escaping((Image?) -> Void)) {
        guard let imageUrl = URL(string: game.backgroundImage ?? constants.urlGambar) else {
            completion(nil)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: imageUrl){ data, _, _ in
            guard let data = data, let artwork = UIImage(data: data) else{
                completion(nil)
                return
            }
            let image = Image(uiImage: artwork)
            completion(image)
        }
        dataTasks.append(dataTask)
        dataTask.resume()
    }

    func reset(){
        dataTasks.forEach{ $0.cancel()}
    }
    
    private func buildUrl(url : String) -> URL? {
        let queryItems = [
            URLQueryItem(name: "key", value: constants.key)
        ]
        var components = URLComponents(string: url)
        components?.queryItems = queryItems
        return components?.url
        
    }
    private func buildUrlDetail(url : String, id: Int) -> URL? {
        let queryItems = [
            URLQueryItem(name: "key", value: constants.key),
        ]
        var components = URLComponents(string: url+"/\(id)")

        components?.queryItems = queryItems
        
        return components?.url
    }}

