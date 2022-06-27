//
//  Country.swift
//  SwiftUI_Realm_oneMany
//
//  Created by 전지훈 on 2022/06/27.
//

import Foundation
import RealmSwift

class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var city: List<City>
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
