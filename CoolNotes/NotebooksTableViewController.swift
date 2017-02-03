//
//  NotebooksTableViewController.swift
//  CoolNotes
//
//  Created by Reinaldo  Verdugo on 3/2/17.
//  Copyright © 2017 Reinaldo Verdugo. All rights reserved.
//

import UIKit
import CoreData

class NotebooksTableViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoolNotes"
        
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch the nb
        let nb = fetchedResultsController!.object(at: indexPath) as! Notebook
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotebookCell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = nb.title
        cell.detailTextLabel?.text = "\(nb.notes?.count) notes"
        
        return cell
    }

}
