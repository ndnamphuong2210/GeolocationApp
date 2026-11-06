//
//  StudentModel.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation

struct Student: Identifiable, Hashable {
    let id: UUID
    var name: String
    var email: String

    init(id: UUID = UUID(), name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }

    func describe() -> String {
        "Student: \(name) (\(email))"
    }
}
