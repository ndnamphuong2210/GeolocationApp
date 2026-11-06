//
//  ErrorModel.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import Foundation

enum ValidationError: LocalizedError {
    case invalidMark
    case duplicateEnrollment
    case invalidEmail
    case invalidCredits
    case duplicateTeacherAssignment
    case missingRequiredFields
    case notFound

    var errorDescription: String? {
        switch self {
        case .invalidMark:
            return "Mark must be between 0 and 10."
        case .duplicateEnrollment:
            return "Student is already enrolled in this subject for this academic year."
        case .invalidEmail:
            return "Please enter a valid email address."
        case .invalidCredits:
            return "Credits must be a positive number."
        case .duplicateTeacherAssignment:
            return "Subject is already assigned to this teacher."
        case .missingRequiredFields:
            return "All required fields must be filled."
        case .notFound:
            return "Item not found."
        }
    }
}
