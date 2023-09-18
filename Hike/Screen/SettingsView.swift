//
//  SettingsView.swift
//  Hike
//
//  Created by Paulo Sousa on 17/09/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    private let alternativeAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Camera",
        "AppIcon-Map",
        "AppIcon-Backpack",
        "AppIcon-Campfire",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Onde se podem encontrar as trilhas perfeitas?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("A trilha é linda na fotografia, mas é ainda melhor quando se está lá. A trilha que espera voltar a fazer um dia. Encontre as melhores trilhas de um dia no app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Está na hora de dar um passeio.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            Section(header: Text("Icones alternativos")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 12) {
                        ForEach(alternativeAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternativeAppIcons[item]) was prossed")
                                UIApplication.shared.setAlternateIconName(
                                    alternativeAppIcons[item]
                                ) { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                              } else {
                                            print("Success! You have changed the app's icons to \(alternativeAppIcons[item])")
                                        }
                                }
                            } label: {
                                Image("\(alternativeAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                        }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Selecione seu icone favorito da coleção.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(
                    rowLabel: "Aplicativo",
                    rowIcon: "apps.iphone",
                    rowContent: "HIKE",
                    rowTintColor: .blue
                )
                CustomListRowView(
                    rowLabel: "Compatibilidade",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                CustomListRowView(
                    rowLabel: "Tecnologia",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                CustomListRowView(
                    rowLabel: "Versão",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                CustomListRowView(
                    rowLabel: "Desenvolvedor",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "Paulo Sousa",
                    rowTintColor: .mint
                )
            }
        } //: LIST
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
