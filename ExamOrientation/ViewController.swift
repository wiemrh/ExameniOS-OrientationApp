//
//  ViewController.swift
//  ExamOrientation
//
//  Created by ESPRIT on 4/17/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource{
    
    let images = ["INSAT","ISI","IHEC","SUPCOM"]
     let nameUniversity = ["INSAT","ISI","IHEC","SUPCOM"]
    let licence = ["License/Prepa","License","License","License"]
     let gouv = ["Ariana","Ariana","Tunis","Tunis"]
    let scores = ["165,01","148,4","130,7","176,0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let contentView = cell?.viewWithTag(0)
        let img = contentView?.viewWithTag(1) as! UIImageView
        let universityN = contentView?.viewWithTag(2) as! UILabel
        let diplome = contentView?.viewWithTag(3) as! UILabel
         let gouvernorat = contentView?.viewWithTag(4) as! UILabel
        img.image = UIImage(named: images[indexPath.row])
        universityN.text = nameUniversity[indexPath.row]
        diplome.text = licence [indexPath.row]
        gouvernorat.text = gouv [indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: indexPath) //appelle PrepareForSegue automatiquement
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let destination = segue.destination as! DetailViewController
            let indice = sender as! IndexPath
            
            destination.nomImage = images[indice.row]
              destination.score = scores[indice.row]
            destination.univName = nameUniversity[indice.row]
             destination.dip = licence[indice.row]
            destination.gouv = gouv[indice.row]
        }
    }


}

