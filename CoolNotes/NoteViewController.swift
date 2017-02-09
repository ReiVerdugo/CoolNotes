//
//  NodeViewController.swift
//  CoolNotes
//
//  Created by Reinaldo  Verdugo on 9/2/17.
//  Copyright © 2017 Reinaldo Verdugo. All rights reserved.
//

import UIKit

class NoteViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch the nb
        let note = fetchedResultsController!.object(at: indexPath) as! Note
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = note.text
        
        return cell
    }

    @IBAction func addNewNote(_ sender: Any) {
        let note = Note(text: "New note", context: fetchedResultsController!.managedObjectContext)
    }

}
