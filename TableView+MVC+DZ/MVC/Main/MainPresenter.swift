//
//  MainPresenter.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation



// MARK: Presenter -
protocol MainPresenterProtocol: AnyObject {
	var view: MainViewProtocol? { get set }
    func viewDidLoad()
    func buttonPressedNext()


}


class MainPresenter: MainPresenterProtocol {
   
    private let passwd = "4444"
   

    weak var view: MainViewProtocol?

    func viewDidLoad() {

    }
    
    func buttonPressedNext() {
        if passwd == view?.text() {
            view?.showNextScreen()
        } else {
            buttonPressedError()
        }
    }
    
    func buttonPressedError() {
        view?.allertError()
    }
    
}
