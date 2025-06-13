import XCTest
@testable import MyAwesomeSDK

final class MyAwesomeSDKTests: XCTestCase {
    func testDataProcessing() {
        let result = DataManager.shared.processData("test")
        XCTAssertEqual(result, "Processed: test")
    }
    
    func testAsyncDataFetch() {
        let expectation = XCTestExpectation(description: "Data fetch")
        
        DataManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                XCTAssertFalse(data.isEmpty)
                expectation.fulfill()
            case .failure:
                XCTFail("Data fetch should succeed")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
