//
//  CollectionViewController.swift
//  lamevasalut
//
//  Created by Raúl Conesa on 21/8/17.
//  Copyright © 2017 Raúl Conesa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GenericCollectionCell"
private let spacing:CGFloat = 0

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sections = [[ : ]]
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.setText()
        
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = spacing
//       layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @objc func setText(){
        
        descriptionLabel.text = "dashboardDescription"

        let informes = [
            "title":"informesResultados",
            "color": UIColor.init(hex: "a2e3d9"),
            "image" : "analisisIcon"
            ] as [String : Any]
        
        let vacunas = [
                 "title":"drawer_vaccines",
                 "color": UIColor.init(hex: "ffa888"),
                 "image" : "vacunasIcon"
                 ] as [String : Any]
             
        let medicacion = [
                 "title":"planMedicacion",
                 "color": UIColor.init(hex: "aab5cd"),
                 "image" : "planMedicacionIcon"
                 ] as [String : Any]
        
        let eConsulta = [
                 "title":"eConsulta",
                 "color": UIColor.init(hex: "f89dd6"),
                 "image" : "eConsultaIcon"
                 ] as [String : Any]
        
        let citaPrevia = [
                 "title":"citaPrevia",
                 "color": UIColor.init(hex: "8682fe"),
                 "image" : "citaPreviaIcon"
                 ] as [String : Any]
        
        let agenda = [
                 "title":"agenda",
                 "color": UIColor.init(hex: "f98b8a"),
                 "image" : "agendaIcon"
                 ] as [String : Any]
        
        let voluntades = [
                 "title":"voluntadDonaciones",
                 "color": UIColor.init(hex: "89dcfd"),
                 "image" : "voluntadesIcon"
                 ] as [String : Any]
        
        let analisis = [
                 "title":"diagnosticos",
                 "color": UIColor.init(hex: "bc9ff3"),
                 "image" : "informesIcon"
                 ] as [String : Any]
        
        let servicios = [
                 "title":"servicios",
                 "color": UIColor.init(hex: "ecdf76"),
                 "image" : "serviciosIcon"
                 ] as [String : Any]

        
        sections = [informes, vacunas, medicacion, eConsulta, citaPrevia, agenda, voluntades, analisis, servicios]
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)

    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
//        cell.backgroundColor = Constants.Colors.accent
    }

    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .blue
      //  cell.titleLabel.textColor = Constants.Colors.firstLevelText
    }


    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let element = sections[indexPath.row]["title"] as? String
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.cellText.text = element
        cell.cellView.backgroundColor = sections[indexPath.row]["color"] as? UIColor
//        cell.cellImage.image = Ui
      
//        cell.cellView.layer.cornerRadius = 24.3
        
        return cell
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        

let padding: CGFloat =  10
let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize / 2, height: collectionViewSize / 1.5)

    }
    
}
