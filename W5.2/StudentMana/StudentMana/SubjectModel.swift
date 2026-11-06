//
//  SubjectModel.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation

struct Subject: Identifiable, Hashable {
    let id: UUID
    var title: String
    var credits: Int
    var semester: Int

    init(id: UUID = UUID(), title: String, credits: Int, semester: Int) {
        self.id = id
        self.title = title
        self.credits = credits
        self.semester = semester
    }

    func describe() -> String {
        "\(title) (\(credits) credits - Sem \(semester))"
    }
}
