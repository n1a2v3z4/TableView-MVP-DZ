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
    func addDataInMassivData(data: Data)                        //2
    func elementInMassivImage(for indexPah: IndexPath) -> Data  //2
    func removeImage(for indexPah: IndexPath)
}

class SecondPresenter: SecondPresenterProtocol {
    
    private var massivData: [Data] = []
    
    
    weak var view: SecondViewProtocol?
    
    func viewDidLoad() {
        
    }
    
    func firstDisplay() {
        if massivData.count == 0 {              //2
                    view?.addLable()
                } else {
                    view?.hideLable()
                    view?.addTableView()
            
        }
    }

    func numberOfElementsInTMassiv() -> Int {
        return massivData.count
    }
    
    func addDataInMassivData(data: Data) {        //2
        massivData.append(data)
    }
    
    func elementInMassivImage(for indexPah: IndexPath) -> Data {  //возвращает элемент из массива
        return massivData[indexPah.row]
    }
    
    func removeImage(for indexPah: IndexPath) {                   //удалили картинку delete
       massivData.remove(at: indexPah.row)
        view?.removeImage(for: indexPah)
      
    }
}



