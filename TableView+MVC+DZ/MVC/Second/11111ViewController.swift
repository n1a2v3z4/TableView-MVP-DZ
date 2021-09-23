//
//  11111ViewController.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol _1111ViewProtocol: AnyObject {

}

class _1111ViewController: UIViewController {

	var presenter: _1111PresenterProtocol = _1111Presenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
}

extension _1111ViewController: _1111ViewProtocol {
    
}
