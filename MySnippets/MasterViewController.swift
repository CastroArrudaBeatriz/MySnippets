//
//  MasterTableViewController.swift
//  MySnippets
//
//  Created by Beatriz Castro on 26/03/21.
//

import UIKit



//tags

class MasterViewController: UITableViewController {
    
//    weak var delegate: SnippetSelectionDelegate?
    
    var snippets: [Snippet] = [
        Snippet(name: "Snippet 1", content: "let x = 10", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 2", content: "let y = true", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 3", content: "let z = \"abc\"", tags: [String("Networking"),String("Persistencia")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        return snippets.count
    }

    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        snippets[indexPath.row].tags.forEach { tag in
            cell.textLabel?.text = tag
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
//        let selectedSnippet = snippets[indexPath.row]
//        delegate?.snippetSelected(selectedSnippet)
//
//        if let detailViewController = delegate as? DetailViewController {
//            splitViewController?.showDetailViewController(detailViewController, sender: nil)
//        }
        
    }
    
    

}
