//
//  JobResponse.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import Foundation

enum Status: String, Codable {
    case karyawanKontrak = "Karyawan Kontrak"
    case karyawanTetap = "Karyawan Tetap"
    case magang = "Magang"
}

struct JobResponse: Decodable {
    let jobVacancyCode, positionName, corporateID, corporateName: String
    let status: Status
    let descriptions: String
    let corporateLogo: String
    let applied: Bool?
    let salaryFrom, salaryTo: Int
    let postedDate: String?
}
