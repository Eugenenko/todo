//
//  firtsTest.swift
//  ToDoFBUITests
//
//  Created by Eugene Tkachenko on 12.04.2021.
//

import XCTest
import Firebase

class firtsTest: XCTestCase {

    let app =  XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        let signOutButton = app.windows.navigationBars["Tasks"].buttons["Sign out"].firstMatch
        if signOutButton.exists {
            signOutButton.tap()
        }
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
//        Thread.sleep(forTimeInterval:10)
        
        let emailTextField = app.windows.scrollViews.textFields["Email"].firstMatch
        let passwordTextField = app.windows.scrollViews.secureTextFields["Password"].firstMatch
        let loginButton = app.windows.scrollViews.buttons["Login"].firstMatch
//        let registerButton = app.windows.scrollViews.buttons["Register"].firstMatch
        
        emailTextField.tap()
        emailTextField.typeText("readdlep@gmail.com")
        passwordTextField.tap()
        passwordTextField.typeText("R1e2d3l4")
        loginButton.tap()
    
        let addTaskButton = app.windows.navigationBars["Tasks"].buttons["Add"].firstMatch
//        let signOutButton = app.windows.navigationBars["Tasks"].buttons["Sign out"].firstMatch
//        let _ = addTaskButton.waitForExistence(timeout: 30)
        XCTAssertTrue(addTaskButton.waitForExistence(timeout: 30), "Add button doesn't appear")
//        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 30), "Add button appears")
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    


}

// XCUIApplicationExtension.swift
// axualiry funcs
/*
func waitForLaunch() {
    let isLaunched = self.wait(for: .runningForeground, timeout: 30)
    XCTAssert(isLaunched == true, "App launch error")
}
 
 
*/
