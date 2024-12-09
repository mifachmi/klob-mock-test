//
//  JobCardView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct JobCardView: View {
    @Binding var viewModel: LowonganTersimpanViewModel
    var dataJob: Jobs
    var pageSection: PageSection
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: dataJob.corporateLogo)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(dataJob.positionName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.blue27))
                
                Text(dataJob.corporateName)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.blue27))
                
                HStack {
                    Text(dataJob.status)
                        .font(.footnote)
                        .foregroundStyle(Color(.blue27))
                    
                    Spacer()
                    
                    Text("IDR \(dataJob.salaryFrom) - \(dataJob.salaryTo)")
                        .font(.caption2)
                        .fontWeight(.regular)
                        .foregroundStyle(Color(.blue27))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color(.blueD9)))
                }
                
                HStack{
                    Text(timeAgo(from: dataJob.postedDate ?? ""))
                        .font(.footnote)
                        .foregroundStyle(Color(.blue27))
                    
                    Spacer()
                    
                    if pageSection == .lowonganKerja {
                        Button {
                            if !viewModel.isJobSaved(job: dataJob) {
                                viewModel.saveJob(job: dataJob)
                            }
                        } label: {
                            Text(viewModel.isJobSaved(job: dataJob) ? "LAMARAN TERKIRIM" : "LAMAR")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 24).fill(viewModel.isJobSaved(job: dataJob) ? Color(.grayCC) : Color(.blue27)))
                        }
                    }
                    
                }
            }
            .padding(.leading, 6)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
    }
}

#Preview {
    @Previewable @State var viewModel = LowonganTersimpanViewModel()
    let job = Jobs(positionName: "Software Engineer", corporateName: "PT. Klob", status: "Fulltime", corporateLogo: "https://logo.com", applied: true, salaryFrom: 10000000, salaryTo: 15000000, postedDate: "2024-12-09")

    JobCardView(viewModel: $viewModel, dataJob: job, pageSection: .lowonganKerja)
}
