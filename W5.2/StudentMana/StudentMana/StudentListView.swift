//
//  StudentListView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject var controller: Controller
    @State private var showingAddSheet = false
    @State private var newName = ""
    @State private var newEmail = ""
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            List(controller.students) { student in
                NavigationLink(destination: StudentDetailView(student: student)) {
                    VStack(alignment: .leading) {
                        Text(student.name).font(.headline)
                        Text(student.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Students")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                addSheet
            }
        }
    }

    private var addSheet: some View {
        NavigationStack {
            Form {
                Section("Student Information") {
                    TextField("Full Name", text: $newName)
                    TextField("Email", text: $newEmail)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                if let error = errorMessage {
                    Text(error).foregroundColor(.red).font(.footnote)
                }
            }
            .navigationTitle("Add Student")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { closeSheet() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                }
            }
        }
    }

    private func save() {
        do {
            try controller.addStudent(name: newName, email: newEmail)
            closeSheet()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func closeSheet() {
        newName = ""
        newEmail = ""
        errorMessage = nil
        showingAddSheet = false
    }
}
#Preview {
    StudentListView()
}
