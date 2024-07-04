import UIKit
import SnapKit

class TableCell: UITableViewCell {
    
    static let identifier = "TableCell"
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratFont(ofSize: 13, weight: .medium)
        
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
        let line = UIView()
        line.backgroundColor = .systemGray4
        
        contentView.addSubview(mainLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(line)
        
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(15)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview().offset(-16)
        }
        
        secondLabel.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).offset(4)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview().offset(-16)
            maker.bottom.equalToSuperview().offset(-2)
            
        }
        
        line.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview().offset(-16)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(1)
        }
    }
    
    
    func config(title: String, deteal: String) {
        mainLabel.text = title
        secondLabel.text = deteal
    }
}

