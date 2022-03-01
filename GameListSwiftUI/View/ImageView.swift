import SwiftUI

struct ImageView: View {
    let image: Image?
    
    var body: some View {
        ZStack {
            if image != nil {
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10.0)
            }else{
                Text("Gambar Tidak Tersedia")
                    .font(.body)
                    
            }
        }
        
        
    }
}
