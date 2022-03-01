//
//  ContentView.swift
//  GameListSwiftUI
//
//  Created by Macbook Pro  on 07/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: GameListViewModel
    var body: some View {
        TabView{
            //gamelist
            NavigationView{
                VStack{
                        List(viewModel.games) { game in
                            GameView(game: game)
                            NavigationLink(
                                destination: DetailView(game: game, detailModel: DetailViewModel(idx:game.id))){
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 0, height: 0)
                            .hidden()
                        }
                }
                .navigationBarTitle("Game List")
                .font(.title2)
                .foregroundColor(.black)
                .ignoresSafeArea(.all)
            }
            .tabItem{
                Image(systemName: "house" )
                
            }
            //myprofile
            NavigationView{
                VStack{
                    
                    HStack{
                        
                        VStack(spacing: 0){
                            
                            Rectangle()
                            .fill(Color.white)
                            .frame(width: 80, height: 3)
                            .zIndex(1)
                            
                            
                            Image("photo")
                            .resizable()
                            .frame(width: 100, height: 120)
                            .padding(.top, 6)
                            .padding(.bottom, 4)
                            .padding(.horizontal, 8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                        }
                        
                        VStack(alignment: .leading, spacing: 12){
                            
                            Text("Kevin Maulana")
                                .font(.title)
                                .foregroundColor(Color.black.opacity(0.8))
                            
                            Text("+6285722703164")
                                .foregroundColor(Color.black.opacity(0.7))
                                .padding(.top, 8)
                            
                            Text("kimlaoxing@gmail.com")
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        .padding(.leading, 20)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer(minLength: 20)
          
                    VStack(spacing: 8){
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Identity")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .font(.title2)
                            
                            Text(" Projek ini ditujukan sebagai submission List View dengan mengambil API rawg.io")
                                .foregroundColor(.white)
                                .font(Font.system (size:15, design: .default))
                                .frame(width: UIScreen.main.bounds.width - 50)
                                
                            
                        }
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30 )
                        .background(Color.black)
                        .cornerRadius(15)
                        
                        
                        
                        //Fitur Belum tersedia
                        Spacer(minLength: 0)

                        
                        //Fitur Belum tersedia
                        
                        }
                    }
                .background(Color.white.edgesIgnoringSafeArea(.all))
                .navigationTitle("Profile")
            }
                .tabItem{
                    Image(systemName: "person" )
                    
                }
        }
       
    }
}





