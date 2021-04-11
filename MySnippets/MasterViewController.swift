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
    
    var tags: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
       
        snippets.forEach { snip in
            snip.tags.forEach { tag in
                if(!tags.contains(tag)){ tags.append(tag)}
            }
        }
        
        return tags.count
    }

    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tags[indexPath.row]
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
