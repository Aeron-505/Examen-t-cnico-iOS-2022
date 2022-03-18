//
//  SignInRequest.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//
import SwiftUI

struct CustomCardMovie: View {
    var image : String
    var title : String
    var release_date : String
    var vote_count : Int
    var overview : String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(image)")){phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 100, maxHeight: 60)
                        .padding()
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
            }
            Text("\(title)")
                .padding()
            HStack{
                Text("\(release_date)")
                Text("\(vote_count)")
            }
            .padding()
            Text("\(overview)")
                .lineLimit(5)
                .padding()
        }
        .cornerRadius(15)
        .background(Color("green").opacity(0.5))
        .frame(width: UIScreen.main.bounds.width/2.2)
    }
}

struct CustomCardMovie_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardMovie(image: "", title: "Test", release_date: "Test", vote_count: 0, overview: "Test")
    }
}
