# Transaction Listing

## Purpose
This is a simple application that connects to a remote service and retrieves a list of transactional data.

## Architecture Approach
This application is written for iOS devices using Xcode 9.4 .1, Swift 4 in June 2018.
The application is written using a Clean Architecture approach that inplements dependancy decoupling. The project was initiated using the [CleanSwift](https://clean-swift.com/handbook/) templates by Raymond Law.

**Clean Swift comprises of the following entities: -** 
- ViewController
- Interactor
- Worker
- Model
- Presenter 

**The application also uses cocoapods package manager to manage 3rd party pod libraries**
(Use 'BudTransaction.xcworkspace - and NOT 'BudTransaction.xcodeproj' to open and run the project in Xcode)

Libraries used
- [SDWebimage](https://github.com/rs/SDWebImage)
Used to control the downloading and cache of the product images.

The application shall contain unit tests using XCTest to guarantee the integrity of the code.    
