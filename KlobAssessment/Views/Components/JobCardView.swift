//
//  JobCardView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct JobCardView: View {
    var dataJob: Jobs
    
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
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.blue27))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color(.blueD9)))
                }
                
                HStack{
                    Text(dataJob.postedDate ?? "")
                        .font(.footnote)
                        .foregroundStyle(Color(.blue27))
                    
                    Spacer()
                    
                    Text("LAMAR")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 24).fill(Color(.blue27)))
                }
            }
            .padding(.leading, 6)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
    }
}

//#Preview {
//    JobCardView()
//}
