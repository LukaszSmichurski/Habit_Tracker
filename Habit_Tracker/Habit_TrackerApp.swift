//
//  Habit_TrackerApp.swift
//  Habit_Tracker
//
//  Created by Łukasz Śmichurski on 07/10/2026.
//

import SwiftUI
import SwiftData

@main
struct Habit_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
