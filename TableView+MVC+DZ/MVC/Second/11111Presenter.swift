//
//  11111Presenter.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Presenter -
protocol _1111PresenterProtocol {
	var view: _1111ViewProtocol? { get set }
    func viewDidLoad()
}

class _1111Presenter: _1111PresenterProtocol {

    weak var view: _1111ViewProtocol?

    func viewDidLoad() {

    }
}
