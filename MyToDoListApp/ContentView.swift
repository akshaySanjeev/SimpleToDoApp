//
//  ContentView.swift
//  MyToDoListApp
//
//  Created by Akshay T S on 19/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ToDoSetupView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(ToDoListModel())
    }
}
