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
        fr.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true),
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
        cell.detailTextLabel?.text = "\(nb.notes!.count) notes"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "displayNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayNote"
        {
            if let VC = segue.destination as? NoteViewController {
                // Create a fetchrequest
                let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
                fr.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true),
                                      NSSortDescriptor(key: "creationDate", ascending: false)]
                
                
                // Find the notebook
                let indexPath = tableView.indexPathForSelectedRow!
                let nb = fetchedResultsController?.object(at: indexPath) as! Notebook
                
                // Create predicate
                let p = NSPredicate(format: "notebook = %@", [nb])
                
                // Add the predicate to the fetch request
                fr.predicate = p
                
                // Create the FetchedResultsController
                let fc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: fetchedResultsController!.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
                
                VC.fetchedResultsController = fc
            }

        }
    }
    
    @IBAction func addNewNotebook(_ sender: Any) {
        let nb = Notebook(title: "New notebook", context: fetchedResultsController!.managedObjectContext)
        print("Just created a notebook \(nb)")
        
    }
    

}
