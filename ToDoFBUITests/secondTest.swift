//
//  secondTest.swift
//  ToDoFBUITests
//
//  Created by Eugene Tkachenko on 15.04.2021.
//

import XCTest
import Foundation

class secondTest: XCTestCase {
    var app: XCUIApplication!
    
    func readFile(fileName: String, fileType: String) -> Data? {
        let bundle = Bundle(for: firtsTest.self)
        guard let path = bundle.path(forResource: fileName, ofType: fileType) else {
            XCTFail("Data has not been found in \(bundle)")
            return nil
        }
        do {
            let content = try Data(contentsOf: URL(fileURLWithPath: path))
            return content
            
        }
        catch let error as NSError {
            XCTFail("Ooops! Something went wrong: \(error)")
            return nil
        }
    }
    
    func getJSONDict(fileName: String) ->  [String: String]  {
        guard let jsonData = readFile(fileName: fileName, fileType: "json") else {
            return [:]
        }
        do {
            return try JSONDecoder().decode([String: String].self, from: jsonData)
        }
        catch {
            let jsonString = String(data: jsonData, encoding: .utf8)
            XCTFail("Bad JSON error: \(error) content:\n" + (jsonString ?? "nil"))
            return [:]
        }
    }
    
//    func testJSONMapping() throws {
//            let bundle = Bundle(for: type(of: self))
//
//            guard let url = bundle.url(forResource: "User", withExtension: "json") else {
//                XCTFail("Missing file: User.json")
//                return
//            }
//
//            let json = try Data(contentsOf: url)
//            let user: Cred = try unbox(data: json)

//            XCTAssertEqual(user.name, "John")
//            XCTAssertEqual(user.age, 29)
        
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()
        
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
        let a = getJSONDict(fileName: "loginsTest")
        print(a)
        
        
        
        app.launch()
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
        XCTAssertTrue(addTaskButton.waitForExistence(timeout: 30), "Add button doesn't appear")
//        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 30), "Add button appears")
        
    
    }
}

