//
//  JobCardView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct JobCardView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(.example)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("Staff Accounting")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.blue27))
                
                Text("Bank Mandiri")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.blue27))
                
                HStack {
                    Text("Karyawan Tetap")
                        .font(.footnote)
                        .foregroundStyle(Color(.blue27))
                    
                    Spacer()
                    
                    Text("IDR 1.000.000 - 5.000.000")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.blue27))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color(.blueD9)))
                }
                
                HStack{
                    Text("19 days ago")
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
        //.padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
    }
}

#Preview {
    JobCardView()
}
