//
//  DoTodayViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 15/05/2023.
//

import UIKit

class DoTodayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousScreen(_:)))
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(backButtonTapGesture)
        
        let doTodayTableViewCalendarCellNib = UINib(nibName: DoTodayTableViewCalendarCell.nibName, bundle: nil)
        tableView.register(doTodayTableViewCalendarCellNib, forCellReuseIdentifier: DoTodayTableViewCalendarCell.reusableCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.backgroundColor = .clear
        tableView.tableHeaderView = headerView
    }
    
    @objc func goBackToPreviousScreen(_ gesture: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}

extension DoTodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 243
    }
}

extension DoTodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calenderCell = tableView.dequeueReusableCell(withIdentifier: DoTodayTableViewCalendarCell.reusableCellIdentifier, for: indexPath)
        return calenderCell
    }
}
