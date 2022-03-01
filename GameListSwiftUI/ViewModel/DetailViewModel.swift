import Foundation
import Combine
import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published public private(set) var detail: GameDetailViewModel?
   
    
    private let dataModel: apiService = apiService()
    private let gambarLoader: apiService = apiService()
    private var disposables = Set<AnyCancellable>()

    init(idx: Int) {
        
       loadDetail(id: idx)
       
    }
    
    private func loadDetail(id: Int) {
    
        dataModel.loadDetail(id: id) { detail in
                self.appendDetail(detail: detail)
        }
    }
    
    
    private func appendDetail(detail: GameDetail) {
        let detailViewModel = GameDetailViewModel(detail: detail)
        print(detailViewModel.description);
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.detail = detailViewModel
        }
    
    }
    
}
