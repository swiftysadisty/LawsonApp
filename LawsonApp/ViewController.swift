import SnapKit
import UIKit


class ViewController: UIViewController {
    var arrayWord: [Word] = [
        Word(learn: "Hello", translate: "Привет"),
        Word(learn: "House", translate: "Дом"),
        Word(learn: "Winter", translate: "Зима"),
        Word(learn: "Book", translate: "Книга")]
    
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        table.backgroundColor = .none
        table.separatorStyle = .none
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
        navigationItem.title = "Все слова"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
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
        return arrayWord.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCell.identifier,
            for: indexPath
            ) as? TableCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .white
        
        let word = arrayWord[indexPath.row]
        let title = word.learn
        let translate = word.translate
        
        cell.config(title: title, deteal: translate)
       
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
   
}
