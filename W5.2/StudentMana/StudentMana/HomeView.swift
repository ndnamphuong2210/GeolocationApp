//
//  HomeView.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            StudentListView()
                .tabItem { Label("Students", systemImage: "person.3") }

            SubjectListView()
                .tabItem { Label("Subjects", systemImage: "book") }

            TeacherListView()
                .tabItem { Label("Teachers", systemImage: "person.crop.rectangle") }

            EnrollmentView()
                .tabItem { Label("Enrollment", systemImage: "square.and.pencil") }
        }
    }
}

#Preview {
    HomeView()
}
