//
//  CellObj.swift
//  st_Table
//
//  Created by Yoshizumi Ashikawa on 2016/03/02.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import Foundation

class CellObj:NSObject {
  var id:Int?
  var name:String?
  var text:String?

  override init() {
    super.init()
  }

  convenience init(id:Int,name:String,text:String) {
		self.init()
		self.id = id
    self.name = name
    self.text = text
	}
}