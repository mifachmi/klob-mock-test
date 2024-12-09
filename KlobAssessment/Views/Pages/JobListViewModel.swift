//
//  JobListViewModel.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import Foundation

@Observable
class JobListViewModel {
    
    var errorMessage: String = ""
    var data: [Jobs] = []
    var isLoading = false
    
    func fetchData() async {
        print("Fetching data...")
        self.isLoading = true
        
        do {
            guard let url = URL(string: ApiService.shared.baseURL) else {
                self.errorMessage = "Invalid URL"
                self.isLoading = false
                return
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let jobs = try JSONDecoder().decode([JobResponse].self, from: data)
            
            // Update UI on the main thread
            DispatchQueue.main.async {
                let jobs = jobs.map { $0.mapToJobModel() }
                self.data = jobs
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
