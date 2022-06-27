//
//  SwiftUI_Realm_oneManyApp.swift
//  SwiftUI_Realm_oneMany
//
//  Created by 전지훈 on 2022/06/27.
//

import SwiftUI

@main
struct SwiftUI_Realm_oneManyApp: App {
    var body: some Scene {
        WindowGroup {
            CountriesListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatistiable")
                }
        }
    }
}
