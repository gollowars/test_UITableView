//
//  CustomCell.swift
//  st_Table
//
//  Created by Yoshizumi Ashikawa on 2016/03/02.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import Foundation
import UIKit

class CustomCell:UITableViewCell {

  @IBOutlet weak var titleLable: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var footerLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    // initialize
		setStyle()
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  func setCell(cellObj:CellObj){
    titleLable.text = cellObj.name
    contentLabel.text = cellObj.text
    footerLabel.text = String(cellObj.id!)


    setStyle()
  }

  private func setStyle(){
    titleLable.numberOfLines = 0
    contentLabel.numberOfLines = 0
    footerLabel.numberOfLines = 0

    titleLable.sizeToFit()
    contentLabel.sizeToFit()
    footerLabel.sizeToFit()

    titleLable.font = UIFont.boldSystemFontOfSize(20)
  }
}