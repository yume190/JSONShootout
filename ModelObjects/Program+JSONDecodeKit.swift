//
//  Program+JSONDecodeKit.swift
//  ModelObjects
//
//  Created by Yume on 2018/1/5.
//  Copyright © 2018年 SwiftBit. All rights reserved.
//

import Foundation
import JSONDecodeKit

extension Program: JSONDecodable {
    public static func decode(json: JSON) throws -> Program {
        return try Program(
            title: json <| "Title",
            chanId: json["Channel"] <| "ChanId",
            description: json <|? "Description",
            subtitle: json <|? "SubTitle",
            recording: json <| "Recording",
            season: json <|? "Season",
            episode: json <|? "Episode"
        )
    }
}

