//
//  TableViewCell.swift
//  AlamofireCurrency
//
//  Created by Admin on 25.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    func setupCell(value: String, base: String, currency: String, date: String) {
        
        valueLabel.text = value
        baseLabel.text = base
        currencyLabel.text = currency
        dateLabel.text = date
    }
    
     let curencyLabelText : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 10)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.text = "currency:"
     return lbl
     }()
    
     let baseLabelText : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 10)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.text = "base:"
     return lbl
     }()
    
     let valueLabelText : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 10)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.text = "value:"
     return lbl
     }()
    
     let dateLabelText : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 10)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     lbl.text = "date:"
     return lbl
     }()
    
     let valueLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 25)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
     }()
    
     let baseLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 25)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
     }()
    
     let currencyLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 25)
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
     }()
    
     let dateLabel : UILabel = {
     let lbl = UILabel()
     lbl.textColor = .black
     lbl.font = UIFont.boldSystemFont(ofSize: 12)
     lbl.adjustsFontSizeToFitWidth = true
     lbl.textAlignment = .center
     lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(curencyLabelText)
        addSubview(baseLabelText)
        addSubview(dateLabelText)
        addSubview(valueLabel)
        addSubview(baseLabel)
        addSubview(currencyLabel)
        addSubview(dateLabel)
        addSubview(valueLabelText)
        
        NSLayoutConstraint.activate([
        
            curencyLabelText.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            curencyLabelText.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            curencyLabelText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
            curencyLabelText.rightAnchor.constraint(equalTo: rightAnchor, constant: -350),
            
            currencyLabel.topAnchor.constraint(equalTo: curencyLabelText.bottomAnchor, constant: 0),
            currencyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            currencyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -350),
            currencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            valueLabelText.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            valueLabelText.leftAnchor.constraint(equalTo: curencyLabelText.rightAnchor, constant: 62),
            valueLabelText.rightAnchor.constraint(equalTo: rightAnchor, constant: -234),
            valueLabelText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
            
            valueLabel.topAnchor.constraint(equalTo: valueLabelText.bottomAnchor, constant: 0),
            valueLabel.leftAnchor.constraint(equalTo: currencyLabel.rightAnchor, constant: 62),
            valueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -234),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            baseLabelText.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            baseLabelText.leftAnchor.constraint(equalTo: valueLabelText.rightAnchor, constant: 62),
            baseLabelText.rightAnchor.constraint(equalTo: rightAnchor, constant: -118),
            baseLabelText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
            
            baseLabel.topAnchor.constraint(equalTo: baseLabelText.bottomAnchor, constant: 0),
            baseLabel.leftAnchor.constraint(equalTo: valueLabel.rightAnchor, constant: 62),
            baseLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -118),
            baseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            dateLabelText.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            dateLabelText.leftAnchor.constraint(equalTo: baseLabelText.rightAnchor, constant: 32),
            dateLabelText.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            dateLabelText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
            
            dateLabel.topAnchor.constraint(equalTo: dateLabelText.bottomAnchor, constant: 0),
            dateLabel.leftAnchor.constraint(equalTo: baseLabel.rightAnchor, constant: 32),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
