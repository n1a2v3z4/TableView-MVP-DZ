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
    func firstDisplay()
    func numberOfElementsInTMassiv() -> Int
}

class SecondPresenter: SecondPresenterProtocol {
   
    
    
    
    weak var view: SecondViewProtocol?
    
    func viewDidLoad() {
        
    }
    
    func firstDisplay() {
        if view?.massImageCount() == 0 {
                    view?.addLable()
                } else {
                    view?.hideLable()
                    view?.addTableView()
            
        }
    }

    func numberOfElementsInTMassiv() -> Int {
       return view?.massImageCount() ?? 0
    }
    
    
}



