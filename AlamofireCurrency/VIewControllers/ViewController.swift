//
//  ViewController.swift
//  AlamofireCurrency
//
//  Created by Admin on 19.08.2022.
//

import UIKit
import Alamofire
import CoreData

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.isHidden = true
        tbl.register(TableViewCell.self, forCellReuseIdentifier: "MyCell")
        tbl.separatorStyle = .none
        return tbl
    }()
    var pairs:[NSManagedObject] = []
    let model = Model()
    let navBar: UINavigationBar = {
       let nvBr = UINavigationBar()
        nvBr.isTranslucent = true
        nvBr.barTintColor = .white
        nvBr.translatesAutoresizingMaskIntoConstraints = false
        nvBr.backgroundColor = .white
        return nvBr
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      view.backgroundColor = .white
      setupUI()
      getData()
  }

      func getData() {
        model.getDataFromCore(completionBlock: { [weak self] output in
            
            self?.pairs = output
            self?.tableView.isHidden = false
            self?.tableView.reloadData()
        })
    }
    
    @objc private func openAddVC() {
        let vc = NewPairViewController()
        vc.completion = { [weak self] in
            self?.getData()
        }
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
}

extension ViewController {
    
    private func setupUI() {
        let hieghtAnchor = self.view.frame.height * 0.05
        let safeArea = self.view.safeAreaLayoutGuide
        
        view.addSubview(navBar)
        view.addSubview(tableView)
        
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        
        let navItem = UINavigationItem(title: "Exchange rates")
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openAddVC))
        
        navItem.rightBarButtonItem = rightBtn
        navBar.setItems([navItem], animated: false)
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navBar.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            navBar.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            navBar.heightAnchor.constraint(equalToConstant: hieghtAnchor),
            
            tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pairs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        let modelCell = pairs[indexPath.row]
        cell.setupCell(value: String(modelCell.value(forKeyPath: "rate") as! Double), base: modelCell.value(forKeyPath: "base") as! String, currency: (modelCell.value(forKeyPath: "currencie") as? String)!, date: (modelCell.value(forKeyPath: "date") as? String)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                model.delete(indexPath: indexPath)
                pairs.remove(at: indexPath.row)
                tableView.reloadData()
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
/*
 {
     base = USD;
     date = "2022-08-21";
     rates =     {
         RUB = "59.50369";
     };
     success = 1;
     timestamp = 1661082483;
 }
 */






