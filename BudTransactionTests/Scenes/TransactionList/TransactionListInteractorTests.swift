//
//  TransactionListInteractorTests.swift
//  BudTransactionTests
//
//  Created by Godfrey Bagley-Clarke on 02/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

@testable import BudTransaction
import XCTest

class TransactionListInteractorTests: XCTestCase {
    
    var sut: TransactionListInteractor!

    override func setUp() {
        super.setUp()
        setupTransactionListInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func setupTransactionListInteractor() {
        sut = TransactionListInteractor()
    }
    
    // MARK: Test Spies
    
    class TransactionListPresentationLogicSpy: TransactionListPresentationLogic {
        var presentTransactionsCalled = false
        func presentTransactions(response: TransactionList.Index.Response) {
            presentTransactionsCalled = true
        }
    }
    
    class TransactionListWorkerSpy: TransactionListWorker {
        var fetchTransactionsFromRemoteCalled = false
        
        override func fetchTransactionsFromRemote(_ request: TransactionList.Index.Request, completionHandler: @escaping (TransactionList.Index.Response) -> Void) {
            fetchTransactionsFromRemoteCalled = true
            completionHandler(TransactionList.Index.Response(data: []))
        }
    }
    
    func testPresentTransactionsCalledFromInteractor() {
        // given
        let transactionListPresentationLogicSpy = TransactionListPresentationLogicSpy()
        sut.presenter = transactionListPresentationLogicSpy
        let transactionListWorkerSpy = TransactionListWorkerSpy()
        sut.worker = transactionListWorkerSpy
        
        // when
        sut.fetchTransactions(request: TransactionList.Index.Request(version: "v2", uniqueId: "123"))
        
        // then
        XCTAssert(transactionListPresentationLogicSpy.presentTransactionsCalled, "presentTransactions must be called from TransactionListInteractor")
        XCTAssert(transactionListWorkerSpy.fetchTransactionsFromRemoteCalled, "getTransactions must call fetchTransactionsFromRemote from TransactionListInteractor")
    }
}
