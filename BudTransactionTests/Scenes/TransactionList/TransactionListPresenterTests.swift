//
//  TransactionListPresenterTests.swift
//  BudTransactionTests
//
//  Created by Godfrey Bagley-Clarke on 02/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

@testable import BudTransaction
import XCTest

class TransactionListPresenterTests: XCTestCase {

    var sut: TransactionListPresenter!

    override func setUp() {
        super.setUp()
        setupTransactionListPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupTransactionListPresenter() {
        sut = TransactionListPresenter()
    }
    
    class TransactionListDisplayLogicSpy: TransactionListDisplayLogic {
        var displayTransactionsCalled = false
        func displayTransactions(viewModel: TransactionList.Index.ViewModel) {
            displayTransactionsCalled = true
        }
    }
    
    func testPresentTransactionsShouldAskViewControllerToDisplayResults() {
        // given
        let transactionListDisplayLogicSpy = TransactionListDisplayLogicSpy()
        sut.viewController = transactionListDisplayLogicSpy
        
        // when
        sut.presentTransactions(response: TransactionList.Index.Response(data: []))
        
        // then
        XCTAssert(transactionListDisplayLogicSpy.displayTransactionsCalled, "Presenter should call viewcontroller to present results")
    }
}
