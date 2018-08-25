//
//  ViewController.swift
//  SwifterTips
//
//  Created by kuroky on 2018/8/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList: [TipsItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        dataList = parserFromJsonFile() ?? []
    }
    
    func setupUI() {
        self.navigationItem.title = "Tips"
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = dataList[section]
        return item.isOpen == true ? (item.items?.count)! + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = dataList[indexPath.section]
        if indexPath.section == 0 {
            cell.textLabel?.text = indexTitle(indexPath: indexPath) + item.title!
        } else {
            let subItem = item.items![indexPath.row - 1]
            cell.textLabel?.text = indexTitle(indexPath: indexPath) + subItem.title!
        }
        return cell
    }
}

func indexTitle(indexPath: IndexPath) -> String {
    
    var sectionTitle = String(indexPath.section + 1) + "."
    if indexPath.row == 0 {
        sectionTitle += " "
    } else {
        sectionTitle = "    " + sectionTitle + String(indexPath.row) + " "
    }
    return sectionTitle
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = dataList[indexPath.section]
        if indexPath.section != 0 {
            
            return
        }
        
        item.isOpen = !item.isOpen
        let selectIndexSet = IndexSet(integer: indexPath.section)
        tableView.reloadSections(selectIndexSet, with: .none)
    }
}
