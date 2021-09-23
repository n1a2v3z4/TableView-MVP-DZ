//
//  SecondPresenter.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation



// MARK: Presenter -
protocol SecondPresenterProtocol: AnyObject {
	var view: SecondViewProtocol? { get set }
    func viewDidLoad()
}

class SecondPresenter: SecondPresenterProtocol {

    private var string: String
    private weak var delegate: MainPresenterProtocol?
    
    weak var view: SecondViewProtocol?
    
    init(string: String, delegate: MainPresenterProtocol?) {
        self.string = string
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        
    }
    
}
