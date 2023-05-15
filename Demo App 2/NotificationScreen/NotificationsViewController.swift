//
//  NotificationsViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 12/05/2023.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let notificationTableViewCellNib = UINib(nibName: NotificationTableViewCell.nibName, bundle: nil)
        tableView.register(notificationTableViewCellNib, forCellReuseIdentifier: NotificationTableViewCell.reusableCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.backgroundColor = .clear
        tableView.tableHeaderView = headerView

    }
}

extension NotificationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        view.backgroundColor = .clear
        return view
    }
}

extension NotificationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.reusableCellIdentifier, for: indexPath) as! NotificationTableViewCell
        return cell
    }
}
