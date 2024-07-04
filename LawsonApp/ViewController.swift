import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        table.backgroundColor = .none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
        setupNavigation()
    }
    
    private func setupNavigation() {
        let rightButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onRightButtonTap)
        )
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .rightBtnNav
    }
    
    private func setupElements() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview().offset(17)
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
           
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func onRightButtonTap() {
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCell.identifier,
            for: indexPath
            ) as? TableCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .white
        
        if indexPath.row == 0 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
   
}
