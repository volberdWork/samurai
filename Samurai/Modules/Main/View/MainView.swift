import UIKit
import SnapKit

class MainView: UIView {
    private let backgroundImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.mainBackground)
        return obj
    }()
    
    let menuButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: .Images.iconMenu), for: .normal)
        return obj
    }()
    
    let tableView: UITableView = {
        let obj = UITableView()
        obj.rowHeight = UITableView.automaticDimension
        obj.separatorStyle = .none
        obj.bounces = false
        obj.clipsToBounds = false
        obj.isScrollEnabled = true
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(backgroundImageView)
        addSubview(menuButton)
        addSubview(tableView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.sizeW)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0.sizeH)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(30.sizeH)
            make.leading.equalToSuperview().inset(16.sizeW)
            make.trailing.equalToSuperview().inset(16.sizeW)
            make.bottom.equalToSuperview().inset(16.sizeH)
        }
        
    }
}
