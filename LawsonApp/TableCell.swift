import UIKit
import SnapKit

class TableCell: UITableViewCell {
    
    static let identifier = "TableCell"
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Privet"
        label.font = UIFont(name: "Montserrat-Bold", size: 16)
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "almaz"
        label.font = UIFont(name: "Montserrat-Medium", size: 13)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupElements() {
       addSubview(mainLabel)
        addSubview(secondLabel)
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).offset(4)
            maker.leading.equalToSuperview()
        }
    }
    
}

