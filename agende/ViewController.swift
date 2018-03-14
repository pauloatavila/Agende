//
//  ViewController.swift
//  agende
//
//  Created by Paulo Atavila on 27/11/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fotoPerfilImage: UIImageView!
    @IBOutlet weak var nomeUserLabel: UILabel!
    @IBOutlet weak var sexoImage: UIImageView!
    @IBOutlet weak var tipoSanguineoLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var nomeEmpresaLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var consultas = [Consulta]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consultas = ConsultaDAO.getList()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        fotoPerfilImage.layer.cornerRadius = 60.0
        fotoPerfilImage.clipsToBounds = true
        
        
        
        //Permissao para notificacoes
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            })
        } else {
            print("Versão inferior a 10")
            
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        //        //notificacao
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = "Hora de sair"
            content.body = "Sua consulta ao dermatologista Pedro Lima está quase na hora. Saia agora para chegar a tempo."
            content.sound = UNNotificationSound.default()
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "notificacao", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else {
            // ios 9
            let notification = UILocalNotification()
            notification.fireDate = NSDate(timeIntervalSinceNow: 5) as Date
            notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
            notification.alertAction = "be awesome!"
            notification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.shared.scheduleLocalNotification(notification)
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consultas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "consultaCell", for: indexPath)
        
        if let consultaCell = cell as? PerfilTableViewCell{
            consultaCell.areaMedicaLabel.text = consultas[indexPath.row].areaMedica
            consultaCell.dataLabel.text = "Data: \(consultas[indexPath.row].data)"
            consultaCell.horarioLabel.text = "Horário: \(consultas[indexPath.row].horario)"
            consultaCell.nomeMedicoLabel.text = consultas[indexPath.row].medico
            consultaCell.tipoConsultaImage.image = UIImage(named: consultas[indexPath.row].areaMedica)
            return consultaCell
        }
        return cell
    }

}

