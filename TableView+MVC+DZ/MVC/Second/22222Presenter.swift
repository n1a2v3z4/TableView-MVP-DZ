//
//  22222Presenter.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: View -
protocol _2222ViewProtocol: class {

}

// MARK: Presenter -
protocol _2222PresenterProtocol: class {
	var view: _2222ViewProtocol? { get set }
    func viewDidLoad()
}

class _2222Presenter: _2222PresenterProtocol {

    weak var view: _2222ViewProtocol?

    func viewDidLoad() {

    }
}
