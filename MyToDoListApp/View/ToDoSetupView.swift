//
//  ToDoSetupView.swift
//  MyToDoListApp
//
//  Created by Akshay T S on 19/06/21.
//

import SwiftUI

struct ToDoSetupView: View {

	@EnvironmentObject var listModel: ToDoListModel
	
	var list: [ToDoListData] {
		return listModel.listEntry
	}

	var body: some View {
		ZStack(alignment: .bottomLeading) {
			NavigationView {
				List {
					ForEach(list) { entry in
						if let index = listModel.getIndex(ofTask: entry) {
							HStack {
								Button(action: {
									listModel.toggleTaskStatus(for: entry)
								}) {
									Image(systemName: entry.completed ? "checkmark.circle.fill" : "circle")
										.foregroundColor(entry.completed ? Color(UIColor.systemBlue) : Color.secondary)
								}
								TextField("Enter Task", text: $listModel.listEntry[index].content)
									.font(.title)
									.foregroundColor(.orange)
							}
						}
					}
					.onDelete(perform: { indexSet in
						listModel.removeContent(atOffsets: indexSet)
					})
					.onMove(perform: { indices, newOffset in
						listModel.moveContents(fromOffsets: indices, toOffset: newOffset)
					})				}
				.navigationTitle("ToDo")
				.navigationBarItems(trailing: EditButton())
			}
			Button(
				action: listModel.add,
				   label: {
				Text("Add Task")
			})
				.padding()
		}
	}
}

struct ToDoSetupView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoSetupView()
			.environmentObject(ToDoListModel())
    }
}
