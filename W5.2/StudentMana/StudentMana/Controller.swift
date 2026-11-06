//
//  Controller.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation
import Combine

final class Controller: ObservableObject {
    @Published private(set) var students: [Student] = []
    @Published private(set) var subjects: [Subject] = []
    @Published private(set) var teachers: [Teacher] = []
    @Published private(set) var enrollments: [Enrollment] = []

    static let defaultYear = "2026-2027"

    init() {
        seedSampleData()
    }
    private func seedSampleData() {
        let s1 = Student(name: "Nguyen Van A", email: "a.nguyen@school.edu.vn")
        let s2 = Student(name: "Tran Thi B", email: "b.tran@school.edu.vn")
        students = [s1, s2]

        let sub1 = Subject(title: "Mobile App Development", credits: 3, semester: 1)
        let sub2 = Subject(title: "Database Systems", credits: 4, semester: 1)
        subjects = [sub1, sub2]

        let t1 = Teacher(name: "Dr. Le Van C",
                         email: "c.le@school.edu.vn",
                         assignedSubjectIds: [sub1.id])
        teachers = [t1]

        enrollments = [
            Enrollment(studentId: s1.id, subjectId: sub1.id,
                       academicYear: Self.defaultYear, mark: 8.5)
        ]
    }

    func studentName(for id: UUID) -> String {
        students.first(where: { $0.id == id })?.name ?? "Unknown"
    }

    func subjectTitle(for id: UUID) -> String {
        subjects.first(where: { $0.id == id })?.title ?? "Unknown"
    }

    func enrollments(of studentId: UUID) -> [Enrollment] {
        enrollments.filter { $0.studentId == studentId }
    }

    func subjects(of teacher: Teacher) -> [Subject] {
        subjects.filter { teacher.assignedSubjectIds.contains($0.id) }
    }

    func availableSubjects(for teacher: Teacher) -> [Subject] {
        subjects.filter { !teacher.assignedSubjectIds.contains($0.id) }
    }

    func enrollment(with id: UUID) -> Enrollment? {
        enrollments.first(where: { $0.id == id })
    }

    func addStudent(name: String, email: String) throws {
        let cleanName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !cleanName.isEmpty, !cleanEmail.isEmpty else {
            throw ValidationError.missingRequiredFields
        }
        guard cleanEmail.contains("@"), cleanEmail.contains(".") else {
            throw ValidationError.invalidEmail
        }
        students.append(Student(name: cleanName, email: cleanEmail))
    }

    func enrollStudent(studentId: UUID,
                       subjectId: UUID,
                       academicYear: String = Controller.defaultYear) throws {
        let year = academicYear.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !year.isEmpty else { throw ValidationError.missingRequiredFields }

        let isDuplicate = enrollments.contains {
            $0.studentId == studentId && $0.subjectId == subjectId && $0.academicYear == year
        }
        if isDuplicate { throw ValidationError.duplicateEnrollment }

        enrollments.append(Enrollment(studentId: studentId,
                                      subjectId: subjectId,
                                      academicYear: year))
    }

    func assignSubjectToTeacher(teacherId: UUID, subjectId: UUID) throws {
        guard let index = teachers.firstIndex(where: { $0.id == teacherId }) else {
            throw ValidationError.notFound
        }
        guard !teachers[index].assignedSubjectIds.contains(subjectId) else {
            throw ValidationError.duplicateTeacherAssignment
        }
        teachers[index].assignedSubjectIds.append(subjectId)
    }

    func updateEnrollmentMark(enrollmentId: UUID, mark: Double) throws {
        guard (0.0...10.0).contains(mark) else { throw ValidationError.invalidMark }
        guard let index = enrollments.firstIndex(where: { $0.id == enrollmentId }) else {
            throw ValidationError.notFound
        }
        enrollments[index].mark = mark
    }
}
