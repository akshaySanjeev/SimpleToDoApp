//
//  ToDoListModel.swift
//  MyToDoListApp
//
//  Created by Akshay T S on 19/06/21.
//

import Foundation

class ToDoListModel: ObservableObject {
	
	@Published var listEntry: [ToDoListData]

	init(list: [ToDoListData] = []) {
		self.listEntry = list
	}

	func getIndex(ofTask task: ToDoListData) -> Int? {
		return self.listEntry.firstIndex(where: {$0.id == task.id})
	}
	func removeContent(atOffsets indexSet: IndexSet) {
		self.listEntry.remove(atOffsets: indexSet)
	}
	func moveContents(fromOffsets indices: IndexSet, toOffset position: Int) {
		self.listEntry.move(fromOffsets: indices, toOffset: position)
	}
	func add(task: String) {
		self.listEntry.append(ToDoListData(id: UUID().uuidString, content: task, completed: false))
	}
	func toggleTaskStatus(for task: ToDoListData) {
		if let index = self.getIndex(ofTask: task) {
			self.listEntry[index].completed.toggle()
		}
	}
}

struct ToDoListData: Identifiable {
	var id: String
	var content: String
	var completed: Bool
}
