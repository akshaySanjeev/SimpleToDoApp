//
//  MyToDoListAppUITests.swift
//  MyToDoListAppUITests
//
//  Created by Akshay T S on 19/06/21.
//

import XCTest

class MyToDoListAppUITests: XCTestCase {

	private var app: XCUIApplication!

    override func setUpWithError() throws {
		self.app = XCUIApplication()
		self.app.launch()
        continueAfterFailure = false
    }

    func testAddingNewTask() throws {

		let addButton = self.app.buttons["addNewTask"]
		let newTaskTextField = self.app.textFields["taskTextField"]
		newTaskTextField.tap()
		newTaskTextField.typeText("Do laundry.")

		addButton.tap()

		let list = self.app.tables["contentList"]
		let cells = list.cells
		XCTAssertEqual(cells.count, 1)

//		let checkBoxButton = cells["completedCheckBoxButton"]
//		checkBoxButton.
    }
}
