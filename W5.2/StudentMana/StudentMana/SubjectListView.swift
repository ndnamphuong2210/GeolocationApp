//
//  SubjectListView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct SubjectListView: View {
    @EnvironmentObject var controller: Controller

    var body: some View {
        NavigationStack {
            List(controller.subjects) { subject in
                VStack(alignment: .leading, spacing: 4) {
                    Text(subject.title).font(.headline)
                    HStack {
                        Text("Credits: \(subject.credits)")
                        Spacer()
                        Text("Semester: \(subject.semester)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
            }
            .navigationTitle("Subjects")
        }
    }
}

#Preview {
    SubjectListView()
}
