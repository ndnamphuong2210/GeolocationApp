//
//  EnrollmentView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct EnrollmentView: View {
    @EnvironmentObject var controller: Controller

    @State private var selectedStudentId: UUID?
    @State private var selectedSubjectId: UUID?
    @State private var academicYear = Controller.defaultYear

    @State private var enrollmentIdForMark: UUID?
    @State private var showMarkAlert = false
    @State private var markInput = ""

    @State private var toastMessage: String?
    @State private var isErrorToast = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Enroll Student in Subject") {
                    Picker("Student", selection: $selectedStudentId) {
                        Text("-- Select Student --").tag(UUID?.none)
                        ForEach(controller.students) { student in
                            Text(student.name).tag(UUID?.some(student.id))
                        }
                    }
                    Picker("Subject", selection: $selectedSubjectId) {
                        Text("-- Select Subject --").tag(UUID?.none)
                        ForEach(controller.subjects) { subject in
                            Text(subject.title).tag(UUID?.some(subject.id))
                        }
                    }
                    TextField("Academic Year", text: $academicYear)

                    Button("Enroll Student") { handleEnrollment() }
                        .buttonStyle(.borderedProminent)
                }

                Section("All Enrollments & Mark Entry") {
                    ForEach(controller.enrollments) { enrollment in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(controller.studentName(for: enrollment.studentId))
                                    .font(.headline)
                                Text("\(controller.subjectTitle(for: enrollment.subjectId)) • \(enrollment.academicYear)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(markButtonTitle(for: enrollment)) {
                                enrollmentIdForMark = enrollment.id
                                markInput = enrollment.mark.map { String($0) } ?? ""
                                showMarkAlert = true
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
            .navigationTitle("Enrollment & Marks")
            .overlay(alignment: .bottom) {
                if let toast = toastMessage {
                    Text(toast)
                        .padding()
                        .background(isErrorToast ? Color.red.opacity(0.9) : Color.green.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .alert("Update Mark (0-10)", isPresented: $showMarkAlert) {
                TextField("Score", text: $markInput)
                    .keyboardType(.decimalPad)
                Button("Save") { handleMarkUpdate() }
                Button("Cancel", role: .cancel) {}
            }
        }
    }

    // MARK: - Helpers
    private func markButtonTitle(for enrollment: Enrollment) -> String {
        if let mark = enrollment.mark {
            return "Mark: \(String(format: "%.1f", mark))"
        }
        return "Enter Mark"
    }

    private func handleEnrollment() {
        guard let studentId = selectedStudentId, let subjectId = selectedSubjectId else {
            showToast("Please select both student and subject", isError: true)
            return
        }
        do {
            try controller.enrollStudent(studentId: studentId,
                                         subjectId: subjectId,
                                         academicYear: academicYear)
            showToast("Enrolled successfully!", isError: false)
        } catch {
            showToast(error.localizedDescription, isError: true)
        }
    }

    private func handleMarkUpdate() {
        let normalized = markInput.replacingOccurrences(of: ",", with: ".")
        guard let enrollmentId = enrollmentIdForMark, let value = Double(normalized) else {
            showToast("Invalid number input", isError: true)
            return
        }
        do {
            try controller.updateEnrollmentMark(enrollmentId: enrollmentId, mark: value)
            showToast("Mark updated successfully!", isError: false)
        } catch {
            showToast(error.localizedDescription, isError: true)
        }
    }

    private func showToast(_ message: String, isError: Bool) {
        withAnimation {
            toastMessage = message
            isErrorToast = isError
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation { toastMessage = nil }
        }
    }
}

#Preview {
    EnrollmentView()
}
