//
//  ViewController.swift
//  st_Table
//
//  Created by Yoshizumi Ashikawa on 2016/03/01.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController {
  var tbv: UITableView!

  var textArray = [String]()
  let headerHeight: CGFloat = 0

  init(){
    super.init(nibName: nil, bundle: nil)

    for(var i = 0;i<10;i++){
      var str = "テスト "
      for(var n = 0;n<i;n++){
				str += str
      }

			textArray.append(String(str))
    }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let barHeight = UIApplication.sharedApplication().statusBarFrame.size.height

    tbv = UITableView(frame: CGRectMake(0, barHeight, view.frame.width, view.frame.height-barHeight))
    tbv.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    tbv.dataSource = self
    tbv.delegate = self
    tbv.estimatedRowHeight = 5 //こいつら設定しないと高さ自動調整されない
    tbv.estimatedSectionHeaderHeight = 0 //こいつら設定しないと高さ自動調整されない
    tbv.rowHeight = UITableViewAutomaticDimension
    view.addSubview(tbv)


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

  override func viewDidLayoutSubviews() {
    print("⭐️⭐️,\(tbv.contentSize.height)")
    print("⭐️⭐️,\(tbv.frame.height)")

    //contentsizeの高さを再計算 headerの高さを設定
		tbv.contentSize = CGSizeMake(tbv.contentSize.width,tbv.contentSize.height+headerHeight)

  }


}

extension CustomTableViewController:UITableViewDelegate,UITableViewDataSource {

	//header
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let label = UILabel(frame: CGRect(x:50, y:0, width: tableView.frame.width-100, height: headerHeight))
    let view = UIView(frame: CGRectMake(0,0,0,0))

    label.font = UIFont.italicSystemFontOfSize(25)
    label.numberOfLines = 0 //こいつら設定しないと高さ自動調整されない
    label.backgroundColor = UIColor.clearColor()
    label.textColor =  UIColor(red: 217/255, green: 0, blue: 0, alpha: 1)
    label.text = "タイトル"
    label.sizeToFit()
    label.autoresizingMask = .FlexibleRightMargin
    view.addSubview(label)



    tbv.tableHeaderView = view
    return view
  }

  // Cell
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return +headerHeight
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return textArray.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
    cell.textLabel?.text = textArray[indexPath.row]
    cell.textLabel?.numberOfLines = 0
    return cell
  }
}