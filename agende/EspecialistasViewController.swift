//
//  EspecialistasViewController.swift
//  agende
//
//  Created by Paulo Atavila on 30/11/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import UIKit

class EspecialistasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var especialidades = ["Cardiologia", "Dermatologia", "Geriatria", "Ginecologia", "Neurologia", "Oftalmologia", "Pediatria", "Psiquiatria"]
    var num = [2, 4, 5, 2, 8, 3, 4, 5]
    
    
    @IBAction func cancelBtt(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return especialidades.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "especialidadesCEll", for: indexPath)
        
        if let cellEsp = cell as? EspecialidadesTableViewCell {
            cellEsp.imagem.image = UIImage(named: especialidades[indexPath.row])
            cellEsp.nomeLabel.text = especialidades[indexPath.row]
            cellEsp.numLabel.text = "\(num[indexPath.row]) profissionais"
            return cellEsp
        }
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
