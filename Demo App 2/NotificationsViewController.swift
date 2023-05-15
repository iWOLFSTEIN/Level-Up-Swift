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
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 190
        tableView.separatorStyle = .none
    }
}

extension NotificationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           // Dequeue the reusable cell that will be displayed in the table view
           let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.reusableCellIdentifier) as! NotificationTableViewCell
        let size = cell.contentView.systemLayoutSizeFitting(CGSize(width: tableView.bounds.width, height: 140))
        return size.height
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // Return automatic height
//        return UITableView.automaticDimension
//    }
}

extension NotificationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.reusableCellIdentifier, for: indexPath) as! NotificationTableViewCell
        return cell
    }
}
