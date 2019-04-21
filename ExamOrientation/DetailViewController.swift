//
//  DetailViewController.swift
//  ExamOrientation
//
//  Created by ESPRIT on 4/17/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var score:String?
     var nomImage:String?
     var univName:String?
    var dip:String?
    var gouv:String?
    
    @IBOutlet weak var segmentedEl: UISegmentedControl!
    @IBOutlet weak var scoreEtud: UILabel!
    @IBOutlet weak var scoreUniv: UILabel!
    @IBOutlet weak var imgUniv: UIImageView!
    
    @IBOutlet weak var MB: UITextField!
    @IBOutlet weak var BB: UITextField!
    @IBOutlet weak var MA: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgUniv.image = UIImage(named: nomImage!)
        scoreUniv.text = score

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveUniv(_ sender: Any) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appdelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Univ")
        fetchRequest.predicate = NSPredicate(format: "imageName == %@",nomImage!)
        
        
        
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            
            print( result.count)
            if(result.count == 0){
                let entityseason = NSEntityDescription.entity(forEntityName: "Univ", in: managedContext)
                let season = NSManagedObject(entity: entityseason!, insertInto: managedContext)
                season.setValue(nomImage!, forKey: "imageName")
                season.setValue(univName!, forKey: "univName")
                 season.setValue( gouv! , forKey: "gouv")
                 season.setValue(dip! , forKey: "diplome")
                
                
                do {
                    try managedContext.save()
                    print("Univ  saved")
                    
                } catch  {
                    let nserror = error as! NSError
                    print(nserror.userInfo)
                }
                
                
                
            } else{
                print("exist")
                let alerte = UIAlertController(title: "alerte", message: "alredy exist", preferredStyle: .alert)
                let alerteaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alerte.addAction(alerteaction)
                self.present(alerte, animated: true, completion: nil)
            }
            
        }catch  {
            let nserror = error as! NSError
            print(nserror.userInfo)
        }
        
        
        
        
        
    }
    

    @IBAction func CalculScore(_ sender: Any) {
        
        
        switch segmentedEl.selectedSegmentIndex {
        case 0 :
            guard let MoyenneB = Double(MB.text!) else {
                print("Not a number:   \(MB.text!)")
                return
            }
            guard let MoyenneBB = Double(BB.text!)else {
                print("Not a number:   \(BB.text!)")
                return
            }
            guard  let MoyenneA = Double(MA.text!)else {
                print("Not a number:   \(MA.text!)")
                return
            }
            
            if(MoyenneB >= 10 ) {
                
                // print(MoyenneB * 10 + MoyenneA * 2)
                scoreEtud.text = String(MoyenneB * 10 + MoyenneA * 2)
                
            }else if((MoyenneB >= 9) && (MoyenneBB  > 10) ) {
                scoreEtud.text = String(MoyenneB * 7.5 + MoyenneBB * 2.5 + MoyenneA * 2)
                return
            }
            
            
        case 1 :
            guard let MoyenneB = Double(MB.text!) else {
                print("Not a number:   \(MB.text!)")
                return
            }
            guard let MoyenneBB = Double(BB.text!)else {
                print("Not a number:   \(BB.text!)")
                return
            }
            guard  let MoyenneA = Double(MA.text!)else {
                print("Not a number:   \(MA.text!)")
                return
            }
            
            if(MoyenneB >= 10 ) {
                
                // print(MoyenneB * 10 + MoyenneA * 2)
                scoreEtud.text = String(MoyenneB * 10 + MoyenneA * 0.75)
                
            }else if((MoyenneB >= 9) && (MoyenneBB  > 10) ) {
                scoreEtud.text = String(MoyenneB * 7.5 + MoyenneBB * 2.5 + MoyenneA * 0.75)
                return
            }
            
        case 2 :
            guard let MoyenneB = Double(MB.text!) else {
                print("Not a number:   \(MB.text!)")
                return
            }
            guard let MoyenneBB = Double(BB.text!)else {
                print("Not a number:   \(BB.text!)")
                return
            }
            guard  let MoyenneA = Double(MA.text!)else {
                print("Not a number:   \(MA.text!)")
                return
            }
            
            if(MoyenneB >= 10 ) {
                
                // print(MoyenneB * 10 + MoyenneA * 2)
                scoreEtud.text = String(MoyenneB * 10 + MoyenneA * 1.75)
                
            }else if((MoyenneB >= 9) && (MoyenneBB  > 10) ) {
                scoreEtud.text = String(MoyenneB * 7.5 + MoyenneBB * 2.5 + MoyenneA * 1.75)
                return
            }
            
            
            
        case 3 :
            guard let MoyenneB = Double(MB.text!) else {
                print("Not a number:   \(MB.text!)")
                return
            }
            guard let MoyenneBB = Double(BB.text!)else {
                print("Not a number:   \(BB.text!)")
                return
            }
            guard  let MoyenneA = Double(MA.text!)else {
                print("Not a number:   \(MA.text!)")
                return
            }
            
            if(MoyenneB >= 10 ) {
                
                // print(MoyenneB * 10 + MoyenneA * 2)
                scoreEtud.text = String(MoyenneB * 10 + MoyenneA * 1)
                
            }else if((MoyenneB >= 9) && (MoyenneBB  > 10) ) {
                scoreEtud.text = String(MoyenneB * 7.5 + MoyenneBB * 2.5 + MoyenneA * 1)
                return
            }
            
            
            
            
            
        default :
            break ;
        }
        
        
        
        
        
    }
}
