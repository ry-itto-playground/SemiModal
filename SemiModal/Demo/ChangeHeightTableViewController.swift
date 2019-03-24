//
//  ChangeHeightTableViewController.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/24.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class ChangeHeightTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    var semiModalPresentationController: SemiModalPresentationController?
    
    var items = ["aaa", "bbb", "ccc"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        semiModalPresentationController = presentationController as? SemiModalPresentationController
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ChangeHeightTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ChangeHeightTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableHeightConstraint.constant -= 50
            semiModalPresentationController?.updateHeight(newHeight: 60 + tableHeightConstraint.constant)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
