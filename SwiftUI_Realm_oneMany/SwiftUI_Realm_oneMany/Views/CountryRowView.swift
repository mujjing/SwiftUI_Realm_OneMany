//
//  CountryRowView.swift
//  SwiftUI_Realm_oneMany
//
//  Created by 전지훈 on 2022/06/27.
//

import SwiftUI
import RealmSwift
struct CountryRowView: View {
    @ObservedRealmObject var country: Country
    @FocusState var isFocused: Bool?
    
    var body: some View {
        HStack {
            TextField("New Country", text: $country.name)
                .focused($isFocused, equals: true)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Text("\(country.city.count) cities")
        }
            .padding()
            .frame(height: 30)
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "canada"))
    }
}
