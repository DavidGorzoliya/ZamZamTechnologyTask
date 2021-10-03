//
//  ViewController.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var openNewScreenButton: UIButton = {
        let openNewScreenButton = UIButton()
        openNewScreenButton.layer.cornerRadius = 4
        openNewScreenButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        openNewScreenButton.backgroundColor = .systemBlue
        openNewScreenButton.addTarget(self, action: #selector(onOpenNewScreen), for: .touchUpInside)
        openNewScreenButton.setTitle("Open new screen", for: .normal)
        openNewScreenButton.titleLabel?.font = .bold(size: 20)
        openNewScreenButton.shadow()

        return openNewScreenButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = .backgroundView
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .backgroundView
        view.addSubview(openNewScreenButton)
        openNewScreenButton.centerInSuperview()
    }
    
    @objc private func onOpenNewScreen() {
        let cardsViewController = CardsViewController()
        navigationController?.pushViewController(cardsViewController, animated: true)
    }
}
