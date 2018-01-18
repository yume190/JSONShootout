//
//  Recording+Gloss.swift
//  JSONShootout
//

import Gloss

extension Recording: JSONDecodable {

  public init?(json: JSON) {
    self.startTsStr = "StartTs" <~~ json ?? ""
    self.recordId   = "RecordId" <~~ json ?? ""
    self.status     = "Status" <~~ json ?? Status.Unknown
    self.recGroup   = "RecGroup" <~~ json ?? RecGroup.Unknown
  }
}
