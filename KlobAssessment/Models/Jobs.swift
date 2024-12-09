//
//  Jobs.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

struct Jobs: Codable, Hashable {
    let positionName, corporateName: String
    let status: String
    let corporateLogo: String
    let applied: Bool?
    let salaryFrom, salaryTo: Int
    let postedDate: String?
}

extension JobResponse {
    func mapToJobModel() -> Jobs {
        return Jobs(positionName: positionName, corporateName: corporateName, status: status, corporateLogo: corporateLogo, applied: applied, salaryFrom: salaryFrom, salaryTo: salaryTo, postedDate: postedDate)
    }
}
