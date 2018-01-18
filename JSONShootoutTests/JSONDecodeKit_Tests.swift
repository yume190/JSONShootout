//
//  JSONDecodeKit_Tests.swift
//  JSONShootoutTests
//
//  Created by Yume on 2018/1/5.
//  Copyright © 2018年 SwiftBit. All rights reserved.
//

import XCTest
import ModelObjects
import JSONDecodeKit

class JSONDecodeKit_Tests: XCTestCase {
    func testDeserialization() {
        self.measure {
            let d:NSDictionary = try! JSONSerialization.jsonObject(with: self.data as Data, options: []) as! NSDictionary
            XCTAssert(d.count > 0)
        }
    }

    func testNonTrace() {
        let json = try! JSONSerialization.jsonObject(with: self.data as Data, options: [])
        self.measure {
            let myJson = JSON(any: json)
            let programs:[Program] = try! myJson["ProgramList"]["Programs"].array()
            XCTAssert(programs.count > 1000)
        }
    }

    func testTrace() {
        let json = try! JSONSerialization.jsonObject(with: self.data, options: []) 
        self.measure {
            let myJson = JSON(any: json,isTraceKeypath:true)
            let programs:[Program] = try! myJson["ProgramList"]["Programs"].array()
            XCTAssert(programs.count > 1000)
        }
    }

    private lazy var data:Data = {
        let path = Bundle(for: type(of: self)).url(forResource: "Large", withExtension: "json")
        let data = try! Data(contentsOf: path!)
        return data
    }()

}
