//
//  TransactionListViewControllerTests.swift
//  BudTransactionTests
//
//  Created by Godfrey Bagley-Clarke on 02/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

@testable import BudTransaction
import XCTest

class TransactionListViewControllerTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: TransactionListViewController!
    var window: UIWindow!

    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupTransactionListViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupTransactionListViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "TransactionListViewController") as! TransactionListViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class TransactionListBusinessLogicSpy: TransactionListBusinessLogic {
        var fetchTransactions = false
        func fetchTransactions(request: TransactionList.Index.Request) {
            fetchTransactions = true
        }
    }
    
    class TableViewSpy: UITableView {
        var reloadDataCalled = false
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    class ActivityIndicatorSpy: UIActivityIndicatorView {
    }
    
    class ViewSpy: UIView {
    }
    
    // Tests
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {
        // Given
        let tableViewSpy = TableViewSpy(frame: CGRect.zero, style: .plain)
        sut.tableView = tableViewSpy
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableViewSpy)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
    
    func testShouldGetTransactionssWhenViewAppears() {
        // Given
        let transactionListBusinessLogicSpy = TransactionListBusinessLogicSpy()
        sut.interactor = transactionListBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssert(transactionListBusinessLogicSpy.fetchTransactions, "getTransactions needs to be called from TransactionListViewController viewDidLoad")
    }

    func testShouldDisplayFetchedTransactions() {
        // given
        let tableViewSpy = TableViewSpy(frame: CGRect.zero, style: .plain)
        sut.tableView = tableViewSpy
        
        let activityIndicatorSpy = ActivityIndicatorSpy(activityIndicatorStyle: .whiteLarge)
        sut.activityIndicator = activityIndicatorSpy
        
        let viewSpy = ViewSpy(frame: CGRect.zero)
        sut.loadingView = viewSpy
        
        let transaction = TransactionList.Index.Transaction(date: "1970-01-01", description: "Description", amount: TransactionList.Index.Amount(value: 19.99, currency_iso: "GBP"), product: TransactionList.Index.Product(icon: "an image url"))
        var transactions : [TransactionList.Index.Transaction] = []
        transactions.append(transaction)
        let viewModel = TransactionList.Index.ViewModel(transactions: transactions, errorMessage: "")
        
        // when
        sut.displayTransactions(viewModel: viewModel)
        
        // then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched transactions should reload the tableview in TransactionListViewController")
    }
}
