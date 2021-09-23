//
//  SecondViewController.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: View -
protocol SecondViewProtocol: AnyObject {

}

class SecondViewController: UIViewController, SecondViewProtocol {

//    var presenter: SecondPresenterProtocol = SecondPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

//        presenter.view = self
//        presenter.viewDidLoad()
    }

}
