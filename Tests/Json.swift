//
//  Json.swift
//
//  Copyright (c) 2017 Anton Lagutin
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import XCTest
import SimpleJson

/// `Json` test case class.
final class JsonTestCase: XCTestCase {

    /// Returns test `Json` instance.
    private var json: Json!

    /// Test setup.
    override func setUp() {
        let bundle = Bundle(for: JsonTestCase.self)

        guard let url = bundle.url(forResource: "Json", withExtension: "json") else {
            fatalError("Cannot locate \"Json.json\" file.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cannot read \"Json.json\" file.")
        }

        guard let any = try? JSONSerialization.jsonObject(with: data) else {
            fatalError("Cannot deserialize \"Json.json\" file.")
        }

        self.json = Json(root: any)
    }
}