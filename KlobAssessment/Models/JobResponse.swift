//
//  JobResponse.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import Foundation

struct JobResponse: Decodable {
    let jobVacancyCode, positionName, corporateId, corporateName: String
    let status: String
    let descriptions: String
    let corporateLogo: String
    let applied: Bool?
    let salaryFrom, salaryTo: Int
    let postedDate: String?
}
