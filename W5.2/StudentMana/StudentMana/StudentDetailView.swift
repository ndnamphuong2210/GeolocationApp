//
//  StudentDetailView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct StudentDetailView: View {
    @EnvironmentObject var controller: Controller
    let student: Student

    var body: some View {
        let studentEnrollments = controller.enrollments(of: student.id)

        List {
            Section("Info") {
                Text("ID: \(student.id.uuidString.prefix(8))")
                Text("Email: \(student.email)")
            }

            Section("Enrolled Subjects & Results") {
                if studentEnrollments.isEmpty {
                    Text("No subjects or marks found for this student.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(studentEnrollments) { enrollment in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(controller.subjectTitle(for: enrollment.subjectId))
                                    .font(.body)
                                Text("Year: \(enrollment.academicYear)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if let mark = enrollment.mark {
                                Text(String(format: "%.1f", mark))
                                    .bold()
                                    .foregroundColor(.blue)
                            } else {
                                Text("N/A")
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(student.name)
    }
}
