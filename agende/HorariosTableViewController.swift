//
//  HorariosTableViewController.swift
//  agende
//
//  Created by Paulo Atavila on 22/02/18.
//  Copyright © 2018 Paulo Atavila. All rights reserved.
//

import UIKit

class HorariosTableViewController: UITableViewController {
    
    var horarios = [["10:30", "11:00", "15:00", "15:30"], ["17:00"], ["14:30", "16:00", "16:30", "17:00"], ["8:00", "9:00", "9:30", "10:00", "11:00", "11:30"], ["14:00", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30"], ["9:00", "10:00", "10:30", "11:00", "15:00", "16:00", "16:30", "17:00"]]
    
    var dias = ["Segunda-feira, 26 de Fevereiro de 2018", "Terça-feira, 27 de Fevereiro de 2018", "Quinta-feira, 1 de Março de 2018", "Segunda-feira, 5 de Março de 2018", "Terça-feira, 27 de Fevereiro de 2018", "Quinta-feira, 1 de Março de 2018"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dias.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return horarios[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < dias.count {
            return dias[section]
        }
        return nil
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "horario", for: indexPath)

        if let cellEsp = cell as? HorariosTableViewCell {
            cellEsp.horario.text = horarios[indexPath.section][indexPath.row]
            return cellEsp
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
