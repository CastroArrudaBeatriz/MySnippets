//
//  SecondaryViewController.swift
//  MySnippets
//
//  Created by Beatriz Castro on 10/04/21.
//

import UIKit

//snippets

protocol SnippetSelectionDelegate: AnyObject {
    func snippetSelected(_ newSnippet: Snippet)
}

class SecondaryViewController: UITableViewController {

    weak var delegate: SnippetSelectionDelegate?
    
    var snippets: [Snippet] = [
        Snippet(name: "Snippet 1", content: "let x = 10", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 2", content: "let y = true", tags: [String("Networking"),String("Persistencia")]),
        
        Snippet(name: "Snippet 3", content: "let z = \"abc\"", tags: [String("Networking")])
    ] {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func refreshUI() {
        loadView()
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
        snippets.append(Snippet(name: "Snippet " + String(next) , content: "", tags: [String("Geral")]))
        tableView.reloadData()
    }
}

extension SecondaryViewController: TagSelectionDelegate {
    func tagSellected(_ snippetsByTag: [Snippet], _ tag: String ) {
        snippets = snippetsByTag
        title = tag
    }
}
