//
//  BudgetTests.swift
//  BudgetTests

import XCTest
@testable import Budget

class BudgetTableViewTests: XCTestCase {

    func testTableViewShowsOnLoad() {
        // given
        let sut = BudgetTableViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasDelegate() {
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testTableViewHasCorrectRowCountBeforeData() {
        // given
        let sut = BudgetTableViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 12)
    }
    
    func testTapToSetShowsWhenZeroBudget() {
        // given
        let sut = BudgetTableViewController()
        // when
        sut.loadViewIfNeeded()
        sut.budgetAmount[0] = 0.0
        // then
            let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertEqual(cell.detailTextLabel?.text, "Tap to set budget")
    }
    
    
    func testNavigationBarHasMyBudgetTitle() {
        // given
        let sut = BudgetTableViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.title, "My Budget")
    }
}


extension BudgetTableViewTests {
    func testInit_BudgetAmount_DoesNotReturnNil(){
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.budgetAmount)
    }
    
    func testInit_Months_DoesNotReturnNil(){
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.Months)
    }
    
    func testInit_Months_Has12Items(){
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.Months.count, 12)
    }
    
    func testInit_BudgetAmount_Has12Items(){
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.budgetAmount.count, 13)
    }
}

extension BudgetTableViewTests {
    func testTableViewConformsToTableViewDataSourceProtocol() {
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let sut = BudgetTableViewController()
        sut.loadViewIfNeeded()
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "Cell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
}
//
//    func testTableCellHasCorrectLabelText() {
//        let sut = BudgetTableViewController()
//        sut.loadViewIfNeeded()
//        let cell0 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
//        XCTAssertEqual(cell0.label.text, "one")
//
//        let cell1 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
//        XCTAssertEqual(cell1.label.text, "two")
//
//        let cell2 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 0))      XCTAssertEqual(cell2.label.text, "three")
//    }
//}
