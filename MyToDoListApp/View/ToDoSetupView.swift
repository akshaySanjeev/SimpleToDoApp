//
//  ToDoSetupView.swift
//  MyToDoListApp
//
//  Created by Akshay T S on 19/06/21.
//

import SwiftUI

struct ToDoSetupView: View {

	@EnvironmentObject var listModel: ToDoListModel
	@State var task: String = ""
	
	var list: [ToDoListData] {
		return listModel.listEntry
	}

	var body: some View {
		NavigationView {
			VStack {
				HStack {
					TextField("Enter task", text: $task)
						.textFieldStyle(RoundedBorderTextFieldStyle())
						.accessibility(identifier: "taskTextField")
					Button(action: {
						listModel.add(task: task)
						task = ""
					}, label: {
						Text("Add")
					})
					.accessibility(identifier: "addNewTask")
				}
				.padding()
				List {
					ForEach(list) { entry in
						HStack {
							Button(action: {
								listModel.toggleTaskStatus(for: entry)
							}) {
								Image(systemName: entry.completed ? "checkmark.circle.fill" : "circle")
									.foregroundColor(entry.completed ? Color(UIColor.systemBlue) : Color.secondary)
							}
							.accessibility(identifier: "completedCheckBoxButton")
							Text(entry.content)
								.font(.title)
								.foregroundColor(.orange)
								.accessibility(identifier: "contentText")
						}
					}
					.onDelete(perform: { indexSet in
						listModel.removeContent(atOffsets: indexSet)
					})
					.onMove(perform: { indices, newOffset in
						listModel.moveContents(fromOffsets: indices, toOffset: newOffset)
					})
				}
				.accessibility(identifier: "contentList")
			}
			.navigationTitle("ToDo")
			.navigationBarItems(trailing: EditButton())
		}
	}
}

struct ToDoSetupView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoSetupView()
			.environmentObject(ToDoListModel())
    }
}
