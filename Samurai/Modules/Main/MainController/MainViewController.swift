import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    
    var tableViewData: [MainCellEnum] = [.single, .storyBack, .tournament, .unlimited] {
        didSet {
            mainView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        initViewController()
    }
    
    private func initViewController() {
        mainView.menuButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        mainView.tableView.registerReusableCell(MainListTableViewCell.self)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.backgroundColor = .clear
    }
    
    @objc private func backButtonTapped() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func singleCellPressed() {
        let vc = GameLoaderController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func storyCellPressed() {
        let vc = GameLoaderController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func unlimitedCellPressed() {
        let vc = GameLoaderController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: tableView delegate/dataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell: MainListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.model = tableViewData[section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let model = tableViewData[section]
        
        // Perform actions based on the selected model
        switch model {
        case .single:
            print("single")
            singleCellPressed()
            break
        case .storyBack:
            print("story")
            storyCellPressed()
            break
        case .tournament:
            print("tournament")
            break
        case .unlimited:
            print("unlimited")
            unlimitedCellPressed()
            break
        }
    }
}
