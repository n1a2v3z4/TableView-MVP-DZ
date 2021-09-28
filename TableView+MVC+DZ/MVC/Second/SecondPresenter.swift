//
//  SecondPresenter.swift
//  TableView+MVC+DZ
//
//  Created Cергей Иванович on 23.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import CoreData


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

class SecondPresenter: NSObject, SecondPresenterProtocol {
    
    private var fetchedResultController: NSFetchedResultsController<ImageData>?

    
    private var massivData: [Data] = []
    
    
    weak var view: SecondViewProtocol?
    
    func viewDidLoad() {
        let fetchRequest: NSFetchRequest<ImageData> = ImageData.fetchRequest()

        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(ImageData.imageCoreData), ascending: true)]
        fetchedResultController = NSFetchedResultsController<ImageData>(
            fetchRequest: fetchRequest,
            managedObjectContext: DatabaseService.shared.persistentContainer.mainContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultController?.delegate = self
        try? fetchedResultController?.performFetch()
    }
    
    func firstDisplay() {
    
        if SecondViewController.numberImage == 0 {              //2
                    view?.addLable()
                } else {
                    view?.hideLable()
                    view?.addTableView()
            
        }
    }

    func numberOfElementsInTMassiv() -> Int {
        return massivData.count
    }
    
    func addDataInMassivData(data: Data) {        //сохранили в coreData
        DatabaseService.shared.insertEntityFor(
            type: ImageData.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { image in
                image.imageCoreData = data
//                note.creationDate = CreationDate(date: Date())
                DatabaseService.shared.saveMain(nil)
                
            }
        )
//   
    }
    
    func elementInMassivImage(for indexPah: IndexPath) -> Data {  //возвращает элемент из массива
        return (fetchedResultController?.object(at: indexPah).imageCoreData)!
    }
    
    func removeImage(for indexPah: IndexPath) {                   //удалили картинку delete
        guard let note = fetchedResultController?.object(at: indexPah) else {return}
        DatabaseService.shared.delete(
            note,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { _ in
                DatabaseService.shared.saveMain(nil)
            }
        )
      
    }
}
extension SecondPresenter: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            view?.addElementToTableView(to: newIndexPath)
            
        case .delete:
            guard let indexPath = indexPath else { return }
            view?.removeImage(for: indexPath)
        default:
            break
        }
    }



}
