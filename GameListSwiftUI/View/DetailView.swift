import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var game: GameViewModel
    @ObservedObject var detailModel: DetailViewModel
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                VStack {
                    WebImage(url: URL(string: game.backgroundImage!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 450)
                        .cornerRadius(10)
                        .ignoresSafeArea(.all)
                        
                    VStack(alignment: .leading){
                        Text(game.name)
                            .font(.title)
                            .fontWeight(.bold)
                        HStack{
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.black)
                                Text(game.released)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                            HStack{
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                                Text(game.rating)
                                    .fontWeight(.medium)
                                    .padding(.vertical, 8)
                            }
                        }
                        AttributedText(detailModel.detail?.description ?? "Deskripsi Game Tidak Tersedia")
                       

                    }
                }
                .padding()
                .padding(.top)
                .background(Color.white)
                .cornerRadius(30)
        }
        }
}
}



