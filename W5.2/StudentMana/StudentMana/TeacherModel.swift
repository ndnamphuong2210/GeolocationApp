//
//  TeacherModel.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation

struct Teacher: Identifiable, Hashable {
    let id: UUID
    var name: String
    var email: String
    var assignedSubjectIds: [UUID]

    init(id: UUID = UUID(), name: String, email: String, assignedSubjectIds: [UUID] = []) {
        self.id = id
        self.name = name
        self.email = email
        self.assignedSubjectIds = assignedSubjectIds
    }

    func describe() -> String {
        "Teacher: \(name) (\(email))"
    }
}
