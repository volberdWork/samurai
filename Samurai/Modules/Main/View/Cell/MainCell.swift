import Foundation
import UIKit
import SnapKit

class MainListTableViewCell: UITableViewCell,Reusable {
    
    var model: MainCellEnum? {
        didSet {
            guard let model = model else {
                return
            }
            
            backgroundImage.image = UIImage(named: model.image)
            titleLabel.text = model.title
        }
    }
    
    let backgroundImage: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    let titleLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.numberOfLines = 0
        obj.textAlignment = .center
        obj.backgroundColor = .clear
        return obj
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        
        backgroundImage.addSubview(titleLabel)
        contentView.addSubview(backgroundImage)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(36.sizeH)
            make.bottom.equalTo(contentView).inset(20.sizeH)
            make.leading.equalTo(contentView).inset(20.sizeW)
            make.trailing.equalTo(contentView).inset(30.sizeW)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).inset(4.sizeH)
            make.leading.equalTo(contentView).inset(0.sizeW)
            make.trailing.equalTo(contentView).inset(0.sizeW)
        }
    }
}

struct MainCell {
    var image: String
    var title: String
}
