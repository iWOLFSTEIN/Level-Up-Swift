import UIKit

class DoTodayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButtonView: UIView!
    
    var cellIdentifiers: [String] = ["DoTodayTableViewCalendarCell", "DoTodayTableViewBasicTasksCell", "DoTodayTableViewExtraTaskCell"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousScreen(_:)))
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(backButtonTapGesture)
        
        let doTodayTableViewCalendarCellNib = UINib(nibName: DoTodayTableViewCalendarCell.nibName, bundle: nil)
        let doTodayTableViewBasicTaskCellNib = UINib(nibName: DoTodayTableViewBasicTasksCell.nibName, bundle: nil)
        let doTodayTableViewExtraTaskCellNib = UINib(nibName: DoTodayTableViewExtraTaskCell.nibName, bundle: nil)
        tableView.register(doTodayTableViewCalendarCellNib, forCellReuseIdentifier: DoTodayTableViewCalendarCell.reusableCellIdentifier)
        tableView.register(doTodayTableViewBasicTaskCellNib, forCellReuseIdentifier: DoTodayTableViewBasicTasksCell.reusableCellIdentifier)
        tableView.register(doTodayTableViewExtraTaskCellNib, forCellReuseIdentifier: DoTodayTableViewExtraTaskCell.reusableCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        let headerSize = CGSize(width: tableView.frame.width, height: 20)
        let headerView = UIView(frame: CGRect(origin: .zero, size: headerSize))
        headerView.backgroundColor = .clear
        tableView.tableHeaderView = headerView
    }
    
    @objc func goBackToPreviousScreen(_ gesture: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}

extension DoTodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let titleHeight = 20
        let tileHeight = 76
        let numberOfTiles = 3
        let extraSpacing = 20
        
        if cellIdentifiers[indexPath.row] == DoTodayTableViewCalendarCell.reusableCellIdentifier {
            return 243
        }
        else if cellIdentifiers[indexPath.row] == DoTodayTableViewBasicTasksCell.reusableCellIdentifier {
            return CGFloat(tileHeight * numberOfTiles + titleHeight + extraSpacing)
        }
        else if cellIdentifiers[indexPath.row] == DoTodayTableViewExtraTaskCell.reusableCellIdentifier {
            return CGFloat(tileHeight * numberOfTiles + titleHeight + extraSpacing)
        }
        return 0
    }
}

extension DoTodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cellIdentifiers[indexPath.row] == DoTodayTableViewCalendarCell.reusableCellIdentifier {
            let calenderCell: DoTodayTableViewCalendarCell = tableView.dequeue(for: indexPath)
            return calenderCell
        } else if cellIdentifiers[indexPath.row] == DoTodayTableViewBasicTasksCell.reusableCellIdentifier {
            let basicTaskCell: DoTodayTableViewBasicTasksCell = tableView.dequeue(for: indexPath)
            return basicTaskCell
        }
        
        let extraTaskCell: DoTodayTableViewExtraTaskCell = tableView.dequeue(for: indexPath)
        return extraTaskCell
    }
}

