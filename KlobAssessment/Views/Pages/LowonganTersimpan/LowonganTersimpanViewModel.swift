//
//  LowonganTersimpanViewModel.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import Foundation

@Observable
class LowonganTersimpanViewModel {
    var savedJobs: Set<Jobs> = []
    
    func saveJob(job: Jobs) {
        savedJobs.insert(job)
    }
    
    func isJobSaved(job: Jobs) -> Bool {
        return savedJobs.contains(job)
    }
}
