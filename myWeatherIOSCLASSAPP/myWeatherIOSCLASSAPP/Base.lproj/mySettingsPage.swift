//
//  mySettingsPage.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 11/22/21.
//

import UIKit

var dataforsettings:[String] = ["set temp to Celsius","set precip to inches","set feelslike to Celsius","set vis to km","set gust to kph","set wind speed to kph"]
class mySettingsPage: UIViewController {
    @IBOutlet var tableViewforSettings:UITableView!
    
    let userDefaultsforSettings = UserDefaults()
    override func viewDidLoad() {
        title = "Settings"
        if(userDefaultsforSettings.value(forKey:"tempsettings") as? String == "Fahrenheit"){
            dataforsettings[0] = "set temp to Celsius"
        }
        else{
            dataforsettings[0] = "set temp to Fahrenheit"
        }
        if(userDefaultsforSettings.value(forKey:"precipsettings") as? String == "mm"){
            dataforsettings[1] = "set precip to in"
        }
        else{
            dataforsettings[1] = "set precip to mm"
        }
        if(userDefaultsforSettings.value(forKey:"feelslikesettings") as? String == "Fahrenheit"){
            dataforsettings[2] = "set feelslike to Celsius"
        }
        else{
            dataforsettings[2] = "set feelslike to Fahrenheit"
        }
        if(userDefaultsforSettings.value(forKey:"vissettings") as? String == "miles"){
            dataforsettings[3] = "set vis to km"
        }
        else{
            dataforsettings[3] = "set vis to miles"
        }
        if(userDefaultsforSettings.value(forKey:"gustsettings") as? String == "mph"){
            dataforsettings[4] = "set gust to kph"
        }
        else{
            dataforsettings[4] = "set gust to mph"
        }
        if(userDefaultsforSettings.value(forKey:"windspeedsettings") as? String == "mph"){
            dataforsettings[5] = "set wind speed to kph"
        }
        else{
            dataforsettings[5] = "set wind speed to mph"
        }
        
        super.viewDidLoad()
        tableViewforSettings.delegate = self
        tableViewforSettings.dataSource =  self

        // Do any additional setup after loading the view.
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
                
extension mySettingsPage: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            if(userDefaultsforSettings.value(forKey:"tempsettings") as? String == "Fahrenheit"){
                dataforsettings[0] = "set temp to Fahrenheit"
                userDefaultsforSettings.setValue("Celsius",forKey:"tempsettings")
                print("VALUE CELSIUS")
                self.tableViewforSettings.reloadData()
            }
            else{
                dataforsettings[0] = "set temp to Celsius"
                userDefaultsforSettings.setValue("Fahrenheit",forKey:"tempsettings")
                print("VALUE FAHRENHEIT")
                self.tableViewforSettings.reloadData()
            }
        }
        if(indexPath.row == 1){
            if(userDefaultsforSettings.value(forKey:"precipsettings") as? String == "mm"){
                dataforsettings[1] = "set precip to mm"
                userDefaultsforSettings.setValue("in",forKey:"precipsettings")
                print("VALUE IN")
                self.tableViewforSettings.reloadData()
            }
            else{
            dataforsettings[1] = "set precip to in"
            userDefaultsforSettings.setValue("mm",forKey:"precipsettings")
                print("VALUE MM")
            self.tableViewforSettings.reloadData()
            }
        }
        if(indexPath.row == 2){
            if(userDefaultsforSettings.value(forKey:"feelslikesettings") as? String == "Fahrenheit"){
                dataforsettings[2] = "set feelslike to Fahrenheit"
                userDefaultsforSettings.setValue("Celsius",forKey:"feelslikesettings")
                print("VALUE CELSIUS")
                self.tableViewforSettings.reloadData()
            }
            else{
            dataforsettings[2] = "set feelslike to Celsius"
            userDefaultsforSettings.setValue("Fahrenheit",forKey:"feelslikesettings")
            print("VALUE FAHRENHEIT")
            self.tableViewforSettings.reloadData()
            }
        }
        if(indexPath.row == 3){
            if(userDefaultsforSettings.value(forKey:"vissettings") as? String == "miles"){
                dataforsettings[3] = "set precip to miles"
                userDefaultsforSettings.setValue("km",forKey:"vissettings")
                print("VALUE KM")
                self.tableViewforSettings.reloadData()
            }
            else{
            dataforsettings[3] = "set vis to km"
            userDefaultsforSettings.setValue("miles",forKey:"vissettings")
            print("VALUE MILES")
            self.tableViewforSettings.reloadData()
            }
        }
        if(indexPath.row == 4){
            if(userDefaultsforSettings.value(forKey:"gustsettings") as? String == "mph"){
                dataforsettings[4] = "set gust to mph"
                userDefaultsforSettings.setValue("kph",forKey:"gustsettings")
                print("VALUE KPH")
                self.tableViewforSettings.reloadData()
            }
            else{
            dataforsettings[4] = "set gust to kph"
            userDefaultsforSettings.setValue("mph",forKey:"gustsettings")
            print("VALUE MPH")
            self.tableViewforSettings.reloadData()
            }
        }
        if(indexPath.row == 5){
            if(userDefaultsforSettings.value(forKey:"windspeedsettings") as? String == "mph"){
                dataforsettings[5] = "set wind speed to mph"
                userDefaultsforSettings.setValue("kph",forKey:"windspeedsettings")
                print("VALUE KPH")
                self.tableViewforSettings.reloadData()
            }
            else{
                dataforsettings[5] = "set wind speed to kph"
                userDefaultsforSettings.setValue("mph",forKey:"windspeedsettings")
                print("VALUE MPH")
                self.tableViewforSettings.reloadData()
            }
        }
    
    }
}

extension mySettingsPage: UITableViewDataSource {

    

    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int {
        return dataforsettings.count
    }
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingscell", for: indexPath)
        cell.textLabel?.text = dataforsettings[indexPath.row]
        return cell
    }
}

