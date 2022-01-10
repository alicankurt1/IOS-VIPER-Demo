//
//  DetailVC.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import UIKit

protocol DetailViewProtocol{
    var presenter: DetailPresenterProtocol? {get set}
    func showCryptoDetail(withCrypto crypto: CryptoModel)
}

class DetailVC: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.sendCryptoToView()
        navigationItem.title = "CRYPTO DETAIL"        
    }
    
    
    func showCryptoDetail(withCrypto crypto: CryptoModel) {      
        currencyNameLabel.text = crypto.currency
        currencyPriceLabel.text = crypto.price
    }
    
    
}
