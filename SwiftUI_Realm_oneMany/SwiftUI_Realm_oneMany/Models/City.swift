//
//  City.swift
//  SwiftUI_Realm_oneMany
//
//  Created by 전지훈 on 2022/06/27.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
