//
//  myCitiesClass.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 11/22/21.
//

import UIKit
                                
class citiesviewclass: UIViewController,UITableViewDelegate,UITableViewDataSource      {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [CitiesList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        getAllItems()
        title = "Cities"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target:self,action:#selector(didTapAdd))
        // Do any additional setup after loading the view.
    }
    @objc private func didTapAdd(){
        let alert = UIAlertController(title: "New Item",
                                      message: "Enter new city",
                                      preferredStyle:.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title:"Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            
            self?.createItem(name: text)
            print("TEST")
            
        }))
        present(alert, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return models.count
    }

    
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.cityName
        return cell
    }
    func getAllItems(){
        do{
        let items = try context.fetch(CitiesList.fetchRequest())
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        catch{
            //error
        }
                                                        
    }
    
    func createItem(name: String){
        let newItem = CitiesList(context: context)
        newItem.cityName = name
        do{
            try context.save()
            getAllItems()
            print("TEST2")
        }
        catch{

        }
    }
    func deleteItem(item: CitiesList){
        context.delete(item)
        do{
            try context.save()
        }
        catch{
            
        }
    }
    func updateItem(item: CitiesList, newCity: String){
        item.cityName = newCity
        do{
            try context.save()
        }
        catch{
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
