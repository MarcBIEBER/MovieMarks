//
//  MainView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

class OrientationManager: ObservableObject {
    @Published var isPortrait: Bool = UIDevice.current.orientation.isPortrait || UIDevice.current.orientation.isFlat
    
    init() {
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
            self.isPortrait = UIDevice.current.orientation.isPortrait || UIDevice.current.orientation.isFlat
        }
    }
}

struct MainView: View {
    @Binding var user: [User]
    @Binding var films: [Film]
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var orientationManager = OrientationManager()

    @State private var selectedFilmIndex: Int? = nil
    @State private var showProfil = false
    @State private var selectedFilm: Film? = nil
    let saveAction: ()->Void
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var scrollViewAxis: Axis.Set {
            orientationManager.isPortrait ? .vertical : .horizontal
        }
    
    var body: some View {
            VStack {
                headerView
                GeometryReader { geometry in
                    if orientationManager.isPortrait {
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack {
                                ForEach(films.indices, id: \.self) { index in
                                    CardView(film: films[index])
                                        .background(Color("BackgroundColor1"))
                                        .cornerRadius(12)
                                        .padding()
                                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                                        .shadow(radius: 1)
                                        .onTapGesture {
                                            selectedFilm = films[index]
                                        }
                                }
                            }
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(films.indices, id: \.self) { index in
                                    CardView(film: films[index])
                                        .background(Color("BackgroundColor1"))
                                        .cornerRadius(12)
                                        .padding()
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .shadow(radius: 1)
                                        .onTapGesture {
                                            selectedFilm = films[index]
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(item: $selectedFilm, onDismiss: {
                selectedFilm = nil
            }) { film in
                DetailView(film: $films[films.firstIndex(where: { $0.id == film.id })!])
            }
            .sheet(isPresented: $showProfil, content: {
                ProfilView(user: $user, saveAction: saveAction)
            })
        }
}

private extension MainView {
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Home")
                    .foregroundColor(Color("main"))
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                HStack {
                    Text("Film")
                        .padding(.horizontal)
                        .background(Color("main"))
                        .cornerRadius(12)
                    Text("Series")
                        .padding(.horizontal)
                        .background(Color("TextFieldBG"))
                        .cornerRadius(12)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Image(systemName: "person.fill")
                .onTapGesture{
                    showProfil = true
                }
            
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("BackgroundColor1"))
        .shadow(radius: 1)
    }
}
