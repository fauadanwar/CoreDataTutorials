//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Fauad Anwar on 07/03/23.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var moveiName: String = ""
    @State private var movies: [Movie] = [Movie]()
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    var body: some View {
        VStack {
            TextField("Enter Movie Name", text: $moveiName)
                .textFieldStyle(.roundedBorder)
            Button("Save") {
                if !moveiName.isEmpty
                {
                    coreDM.saveMovie(title: moveiName)
                    populateMovies()
                }
            }
            List{
                ForEach(movies, id: \.self) { movie in
                    Text(movie.title ?? "")
                }.onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDM.deleteMovie(movie: movie)
                        populateMovies()
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .onAppear {
            populateMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
