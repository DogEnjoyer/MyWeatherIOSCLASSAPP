//
//  PreviousFortuneView.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/10/21.
//

import Foundation
import UIKit
class PreviousFortuneView: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tableviewy: UITableView!
    private var fortunes = [FortuneStorage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Previous Fortunes"
        getAllItems()
        tableviewy.delegate = self
        tableviewy.dataSource = self
        
    }
    func deleteItem(item: FortuneStorage){
        context.delete(item)
        do{
            try context.save()
        }
        catch{
            
        }
    }
    func getAllItems(){
        do{
        fortunes = try context.fetch(FortuneStorage.fetchRequest())
            
            DispatchQueue.main.async{
                self.tableviewy.reloadData()
            }
        }
        catch{
            //error
        }
                                                        
    }
}
extension PreviousFortuneView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me" , indexPath.row)
        let alert = UIAlertController(title: "Are you sure you want to delete this?",
                                      message: "Select yes to delete",
                                      preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Delete",style: .destructive, handler: { _ in self.deleteItem(item: self.fortunes[indexPath.row])
            self.viewDidLoad()
        }))
        alert.addAction(UIAlertAction(title: "Cancel",style: .cancel, handler: nil))
            
        present(alert, animated: true)
        
    }
}
extension PreviousFortuneView: UITableViewDataSource {
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int {
        return fortunes.count
    }
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let text = fortunes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var celltext = "placeholder"
        if(Int(text.storedNum) ?? 0 < 10){
            celltext = "Very Bad Luck"
        }
        else if(Int(text.storedNum) ?? 0 >= 10 && Int(text.storedNum) ?? 0 < 40){
            celltext = "Bad Luck"
        }
        else if(Int(text.storedNum) ?? 0 >= 40 && Int(text.storedNum) ?? 0 < 60){
            celltext = "Average Luck"
        }
        else if(Int(text.storedNum) ?? 0 >= 60 && Int(text.storedNum) ?? 0 < 80){
            celltext = "Good Luck"
        }
        else if(Int(text.storedNum) ?? 0 >= 80 && Int(text.storedNum) ?? 0 < 99){
            celltext = "Very Good Luck"
        }
        cell.textLabel?.text = celltext
        return cell
    }
}
