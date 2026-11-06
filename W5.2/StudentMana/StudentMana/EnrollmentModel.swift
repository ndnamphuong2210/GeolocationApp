//
//  EnrollmentModel.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation

struct Enrollment: Identifiable, Hashable {
    let id: UUID
    let studentId: UUID
    let subjectId: UUID
    let academicYear: String
    var mark: Double?

    init(id: UUID = UUID(),
         studentId: UUID,
         subjectId: UUID,
         academicYear: String = "2026-2027",
         mark: Double? = nil) {
        self.id = id
        self.studentId = studentId
        self.subjectId = subjectId
        self.academicYear = academicYear
        self.mark = mark
    }

    func describe() -> String {
        let score = mark.map { String(format: "%.1f", $0) } ?? "N/A"
        return "Year \(academicYear) - Mark: \(score)"
    }
}
