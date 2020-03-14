import UIKit

struct Country {
    var isoCode: String
    var name: String
}

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productTittle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImage!


}


class ProductTableViewController : UITableViewController {

    let countries = [
        Country(isoCode: "at", name: "Austria"),
        Country(isoCode: "be", name: "Belgium"),
        Country(isoCode: "de", name: "Germany"),
        Country(isoCode: "el", name: "Greece"),
        Country(isoCode: "fr", name: "France"),

    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count / 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CountryTableViewCell
        
        print("Valor de index \(indexPath.row)")
        let firstCountry = countries[indexPath.row + indexPath.row]
        var secondCountry = countries[indexPath.row]
        
        if(indexPath.row < countries.count - 1){
            print("El index es \(indexPath.row)")
            secondCountry = countries[indexPath.row + (indexPath.row + 1)]
        }
        
        cell.productTittle.text = firstCountry.name
        cell.productDescription.text = secondCountry.name

        return cell
    }
}

//0----0,1 , formula --> +0, 0 + (+0 + 1)
//1----2,3 , formula --> +1, 1 + (+1 + 1)
//2----4,5 , formula --> +2, 2 + (+2 + 1)
//3----6,7 , formula --> +3, 3 + (+3 + 1)
