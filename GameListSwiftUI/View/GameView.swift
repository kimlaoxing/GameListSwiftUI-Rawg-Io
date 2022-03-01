import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: GameViewModel
    
    var body: some View {
        VStack(alignment:.center){
            ImageView(image: game.gambar)
            HStack{
                VStack(alignment: .leading){
                    Text(game.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .lineLimit(3)
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
                            .font(.body)
                            .foregroundColor(.black)

                    }
                    
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        
    }
}
