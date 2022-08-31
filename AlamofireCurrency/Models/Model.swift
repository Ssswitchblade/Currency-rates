//
//  Model.swift
//  AlamofireCurrency
//
//  Created by Admin on 23.08.2022.
//

import Foundation
import UIKit
import CoreData
import Alamofire

class Model {
    
  // public var pairs:[NSManagedObject] = []
    
    
    func saveData(base: String, rate: Double, date: String, currencie: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Pairs", in: managedContext)!
        let pair = NSManagedObject(entity: entity, insertInto: managedContext)
        pair.setValue(base, forKey: "base")
        pair.setValue(rate, forKey: "rate")
        pair.setValue(date, forKey: "date")
        pair.setValue(currencie, forKey: "currencie")
        
        do{
            try! managedContext.save()
        } catch let error as NSError {
            print(error)
        }
   }
    
    func getDataFromCore(completionBlock: @escaping ([NSManagedObject]) -> Void) {
        var pairs:[NSManagedObject] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Pairs")
        pairs = try! managedContext.fetch(fetchRequest)
        completionBlock(pairs)
     }
    
    func delete(indexPath: IndexPath) {
        var pairs:[NSManagedObject] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Pairs")
        pairs = try! managedContext.fetch(fetchRequest)
        managedContext.delete(pairs[indexPath.row])
        try! managedContext.save()
    }
    
    //Networking
    func httpRequest(base: String, symbols: String, completionBlock: @escaping (PairModel) -> Void) {
        let headers = HTTPHeaders(["apikey": "D8FDcwg12oMDNz8Czqr6HV4qFMURP0Xz"])
        let session = Session.default
        let url = "https://api.apilayer.com/exchangerates_data/latest?symbols=" + "\(symbols)" + "&base=" + "\(base)"
        
        session.request(url, method: .get, headers: headers).responseDecodable(of: PairModel.self ) { responseData in
            switch responseData.result {
            case .success(let data):
                completionBlock(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
