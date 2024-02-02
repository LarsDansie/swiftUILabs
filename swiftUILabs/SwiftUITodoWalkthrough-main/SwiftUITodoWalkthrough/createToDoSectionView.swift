//
//  createToDoSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Lars Dansie on 1/23/24.
//

import SwiftUI

struct CreateNewSectionView: View {
    @Binding var sections: [TodoSection]
    @Environment(\.dismiss) var dismiss

    @State private var newSectionTitle = ""

    var body: some View {
        VStack {
            Text("Create New Section")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            
            Spacer()
            
            TextField("New Section Title", text: $newSectionTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                )
                .padding()
            Spacer()
        }
        .toolbar(.hidden)
        
        
        VStack {
            Button {
                if !newSectionTitle.isEmpty {
                    addNewSection()
                }
            } label: {
                Text("Create")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                    )
            }
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .foregroundStyle(Color.red)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                            .stroke(.red)
                    )
            }
        }
        .padding()

    }

    func addNewSection() {
        if !newSectionTitle.isEmpty {
            let newSection = TodoSection(sectionTitle: newSectionTitle, todos: [])
            sections.append(newSection)
            dismiss()
        }
    }
}

