//
//  CardsViewController.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import UIKit

final class CardsViewController: UIViewController {

    private var cards: [Card] = Card.makeRandomInstances()

    private var tableView = UITableView()

    private lazy var closeBarbuttonItem = UIBarButtonItem(title: "close".localizable(),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(onClose))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupTableView()
        layout()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 250

        let footerLabel = UILabel(frame: CGRect(x: 12, y: 24, width: 100, height: 16))
        footerLabel.text = "footer_tableview_text".localizable()
        footerLabel.font = .regular(size: 12)
        footerLabel.textColor = .systemGray
        tableView.tableFooterView = footerLabel
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.pinToSuperview()
        navigationItem.rightBarButtonItem = closeBarbuttonItem

    }

    @objc private func onClose() {
        navigationController?.popViewController(animated: true)
    }

    private func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = "limits".localizable()
        backButton.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.bold(size: 20)!],
            for: .normal
        )
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CardsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell else {
            return UITableViewCell()
        }

        let card = cards[indexPath.row]

        cell.cardType = card.type
        cell.maxAccountBalanceView.titleLabel.text = "\(card.maximumAccountBalance)"
        cell.maxCreditBalanceView.titleLabel.text = "\(card.maximumCreditBalance)"

        return cell
    }
}
