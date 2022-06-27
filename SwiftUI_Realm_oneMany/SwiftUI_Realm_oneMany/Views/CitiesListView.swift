//
//  CitiesListView.swift
//  SwiftUI_Realm_oneMany
//
//  Created by 전지훈 on 2022/06/28.
//

import SwiftUI
import RealmSwift

struct CitiesListView: View {
    @ObservedRealmObject var country: Country
    @State private var name = ""
    @FocusState private var isFocused: Bool?
    
    var body: some View {
        VStack {
            HStack {
                TextField("New City", text: $name)
                    .focused($isFocused, equals: true)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button {
                    let newCity = City(name: name)
                    $country.city.append(newCity)
                    name = ""
                    isFocused = nil
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(name.isEmpty)
            }
            .padding()
            List {
                ForEach(country.city) { city in
                    Text(city.name)
                }
                .onDelete(perform: $country.city.remove)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .animation(.default, value: country.city)
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button {
                        isFocused = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }

                }
            }
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(country: Country(name: "canada"))
    }
}
