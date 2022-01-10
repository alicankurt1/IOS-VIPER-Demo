//
//  ViewController.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 8.01.2022.
//

import UIKit


// Talks to Presenter
// Class, Protocol


protocol CryptoViewProtocol{
    var presenter: CryptoPresenterProtocol? {get set}
    
    func update(with cryptos: [CryptoModel])
    func update(with error: Error)
}


class CryptosInfoVC: UIViewController, CryptoViewProtocol{
    
    var presenter: CryptoPresenterProtocol?
    @IBOutlet weak var cryptosTableView: UITableView!    
    var cryptoArray: [CryptoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cryptosTableView.delegate = self
        cryptosTableView.dataSource = self
    }

    func update(with cryptos: [CryptoModel]) {
        // Get Cryptos
        DispatchQueue.main.async {
            self.cryptoArray = cryptos
            self.cryptosTableView.reloadData()
        }
        
    }
    
    func update(with error: Error) {
        // Alert Error
        print("Failed To Update JSON File: \(error)")
    }

}

extension CryptosInfoVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        cell.currencyLabel.text = cryptoArray[indexPath.row].currency
        cell.priceLabel.text = cryptoArray[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showCryptoDetailVC(withCrypto: cryptoArray[indexPath.row])
    }
    
    
}

