//
//  MasterTableViewController.swift
//  MySnippets
//
//  Created by Beatriz Castro on 26/03/21.
//

import UIKit



//tags

protocol TagSelectionDelegate: AnyObject {
    func tagSellected(_ snippetsByTag: [Snippet], _ tag: String )
}

class MasterViewController: UITableViewController {
    
    weak var delegate: TagSelectionDelegate?
    
    var snippets: [Snippet] = [
        Snippet(name: "Snippet 1", content: "let x = 10", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 2", content: "let y = true", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 3", content: "let z = \"abc\"", tags: [String("Networking")])
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
        
        let selectedTag = tags[indexPath.row]
        
        var snippetsByTag: [Snippet] = []
        snippets.forEach { snip in
            if(snip.tags.contains(selectedTag)) {
                snippetsByTag.append(snip)
            }
        }
        delegate?.tagSellected(snippetsByTag, selectedTag)
        if let secondaryView = delegate as? SecondaryViewController {
            splitViewController?.show(UISplitViewController.Column(rawValue: 1)!)
        }
        
    }
    
    

}
