//
//  ViewController.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 11/21/21.
//
            
import UIKit
var datafortableview: [String] = []
class ViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    let userDefaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        tableView.delegate = self
        tableView.dataSource = self                                         
        // Do any additional setup after loading the view.
        var dennis:myWeatherClass = myWeatherClass()
        dennis.setCity(city: self.userDefaults.value(forKey:"viewdefaultcity") as? String ?? "London")
        let handlerBlock:(Bool) -> Void =
        {
            if $0
            {
                DispatchQueue.main.async(execute:{
                    datafortableview.removeAll()
                    datafortableview.append("City: " + dennis.name)
                    datafortableview.append("Region: " + dennis.region)
                    if(self.userDefaults.value(forKey:"tempsettings") as? String == "Fahrenheit"){
                    datafortableview.append("Temperature: " + ((String(Int(dennis.temp_f)))) + " F")
                    }
                    else{
                        datafortableview.append("Temperature: " + ((String(Int(dennis.temp_c)))) + " C")
                    }
                    if(self.userDefaults.value(forKey:"feelslikesettings") as? String == "Fahrenheit"){
                        datafortableview.append("Feels like: " + ((String(Int(dennis.feelslike_f)))) + " F")
                    }
                    else{
                        datafortableview.append("Feels like: " + ((String(Int(dennis.feelslike_c)))) + " C")
                    }
                    if(dennis.is_day == 1){
                        datafortableview.append("Day time")
                    }
                    else{
                        datafortableview.append("Night time")
                    }
                    if(self.userDefaults.value(forKey:"gustsettings") as? String == "mph"){
                    datafortableview.append("Gust Speed: " + ((String(Int(dennis.gust_mph)))) + " MPH")
                    }
                    else{
                        datafortableview.append("Gust Speed: " + ((String(Int(dennis.gust_kph)))) + " KPH")
                    }
                    datafortableview.append("UV: " + ((String(Int(dennis.uv)))))
                    datafortableview.append("Humidity: " + ((String(Int(dennis.vis_miles)))))
                    datafortableview.append("Wind Degree: " + ((String(dennis.wind_degree))))
                    if(self.userDefaults.value(forKey:"windspeedsettings") as? String == "mph"){
                    datafortableview.append("Wind Speed: " + ((String(Int(dennis.wind_mph)))) + " mph")
                    }
                    else{
                        datafortableview.append("Wind Speed: " + ((String(Int(dennis.wind_kph)))) + " kph")
                    }
                    if(self.userDefaults.value(forKey:"vissettings") as? String == "miles"){
                    datafortableview.append("Visibility: " + ((String(Int(dennis.vis_miles)))) + " MILES")
                    }
                    else{
                        datafortableview.append("Visibility: " + ((String(Int(dennis.vis_km)))) + " KM")
                    }
                    datafortableview.append("Condition: " + dennis.text)

                    self.tableView.reloadData()
                    

                })
                                        
            }
            
        }
        dennis.filldata(completion:handlerBlock)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target:self,
                                                            action:#selector(didTapAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target:self,
                                                            action:#selector(didTapRefresh))
        
    }
    @objc private func didTapRefresh(){
        self.viewDidLoad()
    }
    @objc private func didTapAdd(){
        let alert = UIAlertController(title: "Change City",
                                      message: "Enter new city",
                                      preferredStyle:.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title:"Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            self?.userDefaults.setValue(text,forKey:"viewdefaultcity")
        }))
        present(alert, animated: true)

    }

}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me" , indexPath.row)

    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int {
        return datafortableview.count
    }
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datafortableview[indexPath.row]
        return cell
    }
}
