//
//  ViewController.swift
//  Journal
//
//  Created by George Davis IV on 4/8/20.
//  Copyright © 2020 3DMations. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Create a Table & Label
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    //Create an array of tuples, title for notes and note itself, by default it will be empty
    var models: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //Assign the table
        table.delegate = self
        table.dataSource = self
        title = "Notes"

    }

    //Create an action function that the use can tap a button to create a new note
    @IBAction func didTapNewNote() {
        gaurd let vc = storyboard?.instantiateViewController(identifier: "new") as? ?EntryViewController else {
            return
        }
        vc.title = "New Note"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Show note Controller
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        
        vc.title = "Note"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

