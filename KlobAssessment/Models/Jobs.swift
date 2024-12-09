//
//  Jobs.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

struct Jobs: Codable {
    let positionName, corporateName: String
    let status: Status
    let corporateLogo: String
    let applied: Bool?
    let salaryFrom, salaryTo: Int
    let postedDate: String?
}
