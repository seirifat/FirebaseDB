//
//  FirebaseDBTests.swift
//  FirebaseDBTests
//
//  Created by Rifat Firdaus on 10/1/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import XCTest
import SwiftDate
@testable import FirebaseDB

class FirebaseDBTests: XCTestCase {
    
    func testColloquialRegion() {
        let agoDate = DateInRegion() - 5.minutes
        let collo = agoDate.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.indonesian)
        XCTAssertEqual(collo, "5 menit yang lalu")
    }
    
    func testColloquialString() {
        let agoDate = "2018-12-15T14:49:19+07:00".toDate()
        let collo = agoDate?.date.toColloquialString()
        XCTAssertEqual(collo, "4 hari yang lalu")
    }
    
//    func testLogin() {
//        let interactor = LoginInteractor()
//        let expect = expectation(description: "Login Success!")
//        let disposeBag = DisposeBag()
//        interactor.email.value = "rifat"
//        interactor.password.value = "12341234"
//        Observable.just(Void())
//            .flatMapLatest{ _ in interactor.login() }
//            .do(onNext: { _ in
//                XCTAssert(true)
//                expect.fulfill()
//            }, onError: { error in
//                XCTAssertNil(error, "🚫 \(error.localizedDescription)")
//            })
//            .subscribe()
//            .disposed(by: disposeBag)
//        waitForExpectations(timeout: 20) { (error) in
//            XCTAssertNil(error, "Time out \(String(describing: error?.localizedDescription))")
//        }
//    }
    
}
