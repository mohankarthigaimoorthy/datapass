//
//  ViewController.swift
//  PassData
//
//  Created by Mohan K on 16/11/22.
//

import UIKit

struct Section {
    let title:  String
    let options : [SettingsOption]
}
struct SettingsOption {
    let title: String
    let  icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        

    }
    
    func configure() {
        //        self.models = Array(0...15).compactMap({
        //
        //            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
        //
        models.append (Section (title: "general", options: [
            SettingsOption(title: "wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            },
            SettingsOption(title: "bluetooth", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            },
            SettingsOption(title: "aeroplanemood", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            },
            SettingsOption(title: "internet", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            }
            
            
        ]   )
                       
        )
        
        
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].options.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.section].options[indexPath.row]
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
                     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            tableView.deselectRow(at: indexPath, animated: true)
            let model = models[indexPath.section].options[indexPath.row]
            model.handler()
        }
}

                              

