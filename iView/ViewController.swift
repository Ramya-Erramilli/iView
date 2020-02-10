//
//  ViewController.swift
//  iView
//
//  Created by Ramya Seshagiri on 07/02/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
//    var names = ["Tom","Jerry","JhonnyBravo","PowerPuffGirls","Dexter","Tweety","Oswald","BugsBunny","Popeye","Pingu","RoadRunner","ScoobyDoobyDoo","TeleTubbies"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
//        print(path)
        let items = try! fileManager.contentsOfDirectory(atPath: path+"/Content")

        for item in items{
                pictures.append(item)
        }
        
        navigationItem.title = "View your cartoon"
    }
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell =  tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon")
//        print("here")
        return cell
        
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let newVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? DetailViewController{
            newVC.selectedImage = pictures[indexPath.row]
            
            navigationController?.pushViewController(newVC, animated: true)
        }
        
        
    }
    
    
    
    // MARK : - FM using URL
//    static func loadImagesFromAlbum(folderName:String) -> [String]{
//
//        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
//        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
//        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
//        var theItems = [String]()
//        if let dirPath          = paths.first
//        {
//            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(folderName)
//
//            do {
//                theItems = try FileManager.default.contentsOfDirectory(atPath: imageURL.path)
//                return theItems
//            } catch let error as NSError {
//                print(error.localizedDescription)
//                return theItems
//            }
//        }
//        return theItems
//    }

    
    

}

