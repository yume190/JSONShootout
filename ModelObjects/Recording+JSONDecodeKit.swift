//
//  Recording+JSONDecodeKit.swift
//  ModelObjects
//
//  Created by Yume on 2018/1/5.
//  Copyright © 2018年 SwiftBit. All rights reserved.
//

import Foundation
import JSONDecodeKit

extension Recording: JSONDecodable {
    public static func decode(json: JSON) throws -> Recording {
        return try Recording(
            startTsStr: json <| "StartTs",
            status: json <|? "Status" ?? .Unknown,
            recordId: json <| "RecordId",
            recGroup: json <|? "RecGroup" ?? .Unknown
        )
    }
}

