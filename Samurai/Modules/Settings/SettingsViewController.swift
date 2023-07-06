

import MessageUI
import StoreKit

class SettingsViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private let model: [SettingstModel] = [.leaderBoard, .policy, .terms, .shareUpp, .notification, .vibration, .rateUs, .feedback]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        self.view.backgroundColor = .theme(.profileImageBackground)
        self.title = "Settings"
        tableView = UITableView(frame:.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.reloadData()
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func openNotificationSettings() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
    
    func rateUs() {
        if #available(iOS 14.0, *) {
            guard let scene = view.window?.windowScene else { return }
            SKStoreReviewController.requestReview(in: scene)
        } else {
            SKStoreReviewController.requestReview()
        }
    }
    
    func vibrationSwitchTapped(isOn: Bool) {
        if isOn {
            UserDefaults.standard.set(true, forKey: "vibrations")
//            UIDevice.vibrate()
        } else {
            UserDefaults.standard.set(false, forKey: "vibrations")
        }
    }
    
    func reminderSwitchTapped(isOn: Bool) {
//        UIDevice.vibrate()
//        if isOn {
//            NotificationManager.requestNotifications()
//            UserDefaults.standard.set(true, forKey: "eventReminder")
//        } else {
//            NotificationManager.disableNotifications()
//            UserDefaults.standard.set(false, forKey: "eventReminder")
//        }
    }
    
    func notificationSwitchTapped(isOn: Bool) {
//        UIDevice.vibrate()
//        if isOn {
//            UserDefaults.standard.set(true, forKey: "notification")
//            if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
//                UIApplication.shared.open(appSettings)
//            }
//        } else {
//            UserDefaults.standard.set(false, forKey: "notification")
//        }
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.layoutIfNeeded()
        cell.selectionStyle = .none
        cell.disclosureIcon.isHidden = true
        cell.switchButton.isHidden = true
        cell.titleLabel.text = model[indexPath.row].title
        cell.descriptionLabel.text = model[indexPath.row].subTitle
        cell.isUserInteractionEnabled = true
        cell.contentView.isUserInteractionEnabled = true
        switch indexPath.row {
        case 4, 5:
            cell.switchButton.isHidden = false
            if indexPath.row == 4 {
                if UserDefaults.standard.bool(forKey: "notification") == false {
                    cell.toogleHandler(false)
                } else {
                    cell.toogleHandler(true)
                }
            }
            if indexPath.row == 5 {
                if UserDefaults.standard.bool(forKey: "vibrations") == false {
                    cell.toogleHandler(false)
                } else {
                    cell.toogleHandler(true)
                }
            }
        default:
            cell.disclosureIcon.isHidden = false
            cell.switchButton.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let model = model[row]
        
        switch model {
        case .leaderBoard:
            print("")
        case .policy:
            print("")
        case .terms:
            print("")
        case .shareUpp:
            print("")
        case .notification:
            print("")
        case .vibration:
            print("")
        case .rateUs:
            rateUs()
        case .feedback:
            print("")
        }
    }
}

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
