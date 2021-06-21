//
//  MyToDoListApp.swift
//  MyToDoListApp
//
//  Created by Akshay T S on 19/06/21.
//

import SwiftUI

@main
struct MyToDoListAppApp: App {

	@StateObject private var toDoListModel = ToDoListModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(toDoListModel)
        }
    }
}
