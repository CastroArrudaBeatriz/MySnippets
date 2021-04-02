//
//  MasterTableViewController.swift
//  MySnippets
//
//  Created by Beatriz Castro on 26/03/21.
//

import UIKit

protocol SnippetSelectionDelegate: AnyObject {
    func snippetSelected(_ newSnippet: Snippet)
}


class MasterViewController: UITableViewController {
    
    weak var delegate: SnippetSelectionDelegate?
    
    var snippets: [Snippet] = [
        Snippet(name: "Snippet 1", content: "let x = 10"),
        Snippet(name: "Snippet 2", content: "let y = true"),
        Snippet(name: "Snippet 3", content: "let z = \"abc\"")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        return snippets.count
    }

    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = snippets[indexPath.row].name

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        let selectedSnippet = snippets[indexPath.row]
        delegate?.snippetSelected(selectedSnippet)

        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
        
    }
    
    
    @IBAction func addSnippet(_ sender: Any) {
        let next = snippets.count + 1
        snippets.append(Snippet(name: "Snippet " + String(next) , content: ""))
        tableView.reloadData()
    }
    

}
