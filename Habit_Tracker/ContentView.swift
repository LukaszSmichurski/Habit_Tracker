//
//  ContentView.swift
//  Habit_Tracker
//
//  Created by Łukasz Śmichurski on 07/10/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var habits: [Habit]
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            Group {
                if habits.isEmpty {
                    ContentUnavailableView(
                        "No Habits Yet",
                        systemImage: "checkmark.circle",
                        description: Text("Tap the + button to add your first habit. ")
                    )
                } else {
                    List {
                        ForEach(habits) { habit in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.name)
                                        .font(.headline)
                                    Text("Completed \(habit.timesCompleted) times")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button {
                                    habit.timesCompleted += 1
                                } label: {
                                    Image(systemName: "checkmark.circle")
                                        .font(.title2)
                                        .foregroundStyle(.green)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .onDelete(perform: deleteHabits)
                    }
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView()
            }
        }
    }
    
    private func deleteHabits(offsets: IndexSet) {
        for index in offsets {
            let habitToDelete = habits[index]
            modelContext.delete(habitToDelete)
        }
    }
}
