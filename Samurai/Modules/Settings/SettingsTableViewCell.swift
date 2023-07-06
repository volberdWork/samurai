

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: SettingsTableViewCell.self)
    
    var toogleHandler: (Bool) -> () = { _ in }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var switchButton: UISwitch!
    var disclosureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: .Images.arrow)
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var disclosureLine = UIView()
    var conteinerView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        conteinerView = UIView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var onTintColor: UIColor {
        guard var image = UIImage(named: "switchOnBG") else { return .blue }
        return  UIColor(patternImage: image)
    }
    
    func setUp() {
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.isHidden = true
        switchButton.tintColor = .white.withAlphaComponent(0.5)
        switchButton.onTintColor = onTintColor
        switchButton.layer.cornerRadius = 16
        switchButton.clipsToBounds = true
        toogleHandler = { isOn in
            self.switchButton.isOn = isOn
        }
        conteinerView.addSubview(switchButton)
        conteinerView.addSubview(titleLabel)
        conteinerView.addSubview(disclosureIcon)
        conteinerView.backgroundColor = .theme(.cellSet)
        conteinerView.layer.cornerRadius = 8
        self.addSubview(conteinerView)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  0),
            conteinerView.heightAnchor.constraint(equalToConstant: 44),
            
            titleLabel.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
            
            disclosureIcon.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
            disclosureIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            disclosureIcon.heightAnchor.constraint(equalToConstant: 24),
            disclosureIcon.widthAnchor.constraint(equalToConstant: 24),
            
            switchButton.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
            switchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            switchButton.widthAnchor.constraint(equalToConstant: 51),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: 8),
        ])
    }
}

