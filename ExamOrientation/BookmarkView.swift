//
//  BookmarkView.swift
//  ExamOrientation
//
//  Created by ESPRIT on 4/18/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class BookmarkView: UIViewController , UITableViewDataSource, UITableViewDelegate {
    var univ : [NSManagedObject] = []
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return univ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        let contentView = cell?.viewWithTag(0)
        let img = contentView?.viewWithTag(1) as! UIImageView
        let titreUniv = contentView?.viewWithTag(2) as! UILabel
        let dip = contentView?.viewWithTag(3) as! UILabel
        let gouv = contentView?.viewWithTag(4) as! UILabel
        
        img.image = UIImage(named: univ[indexPath.row].value(forKey: "imageName") as! String)
        titreUniv.text = univ[indexPath.row].value(forKey: "univName") as! String
          dip.text = univ[indexPath.row].value(forKey: "diplome") as! String
          gouv.text = univ[indexPath.row].value(forKey: "gouv") as! String
          
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Univ")
       do {
            try univ = managedContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch  {
            
            let nsError = error as! NSError
            print(nsError.userInfo)
        }
        
        

        
        
    }
    
  
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            
            let appDeleagate = UIApplication.shared.delegate as! AppDelegate
            let persContainer  = appDeleagate.persistentContainer
            let managetCont = persContainer.viewContext
            managetCont.delete(univ[indexPath.row])
            do
            {
                try managetCont.save()
                
            }catch {
                let nserror = error as NSError
                print(nserror.userInfo)
                
            }
            univ.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
        }
        
    }

  

    }
