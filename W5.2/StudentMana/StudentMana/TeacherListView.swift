//
//  TeacherListView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct TeacherListView: View {
    @EnvironmentObject var controller: Controller
    @State private var selectedTeacher: Teacher?
    @State private var selectedSubjectId: UUID?
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            List(controller.teachers) { teacher in
                VStack(alignment: .leading, spacing: 6) {
                    Text(teacher.name).font(.headline)
                    Text(teacher.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    let assigned = controller.subjects(of: teacher)
                    if !assigned.isEmpty {
                        Text("Teaches: " + assigned.map { $0.title }.joined(separator: ", "))
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }

                    Button("Assign Subject") {
                        selectedSubjectId = nil
                        errorMessage = nil
                        selectedTeacher = teacher
                    }
                    .font(.caption)
                    .buttonStyle(.bordered)
                    .padding(.top, 4)
                }
            }
            .navigationTitle("Teachers")
            .sheet(item: $selectedTeacher) { teacher in
                assignSheet(for: teacher)
            }
        }
    }

    private func assignSheet(for teacher: Teacher) -> some View {
        NavigationStack {
            Form {
                Section("Select Subject for \(teacher.name)") {
                    Picker("Subject", selection: $selectedSubjectId) {
                        Text("-- Choose Subject --").tag(UUID?.none)
                        ForEach(controller.availableSubjects(for: teacher)) { sub in
                            Text(sub.title).tag(UUID?.some(sub.id))
                        }
                    }
                }
                if let error = errorMessage {
                    Text(error).foregroundColor(.red).font(.footnote)
                }
            }
            .navigationTitle("Assign Subject")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        errorMessage = nil
                        selectedTeacher = nil
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard let subjectId = selectedSubjectId else {
                            errorMessage = "Please choose a subject."
                            return
                        }
                        do {
                            try controller.assignSubjectToTeacher(teacherId: teacher.id,
                                                                  subjectId: subjectId)
                            errorMessage = nil
                            selectedTeacher = nil
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TeacherListView()
}
