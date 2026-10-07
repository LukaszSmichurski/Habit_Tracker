//
//  AddHabitView.swift
//  Habit_Tracker
//
//  Created by Łukasz Śmichurski on 08/10/2026.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var habitName = " "
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Habit name")){
                    TextField("e.g. Morning run", text: $habitName)
                }
            }
            .navigationTitle("New habit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        let newHabit = Habit(name: habitName)
                        modelContext.insert(newHabit)
                        dismiss()
                    }
                    .disabled(habitName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

