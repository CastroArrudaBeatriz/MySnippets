//
//  DetailViewController.swift
//  MySnippets
//
//  Created by Beatriz Castro on 26/03/21.
//

import UIKit
import Sourceful


import UIKit
import Sourceful

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: SyntaxTextView!
    
    let lexer = SwiftLexer()
    let lexerPython = Python3Lexer()

    var snippet: Snippet? {
        didSet {
            refreshUI()
        }
    }
    
    var language = "swift"
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Swift", image: UIImage(systemName: "doc"), handler: { (_) in
                self.language = "swift"
                self.textView.delegate = self

            }),
            UIAction(title: "Python 3", image: UIImage(systemName: "doc.fill"), handler: { (_) in
                self.language = "python"
                self.textView.delegate = self

            })
        ]
    }
    
    var languageMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }

    private func refreshUI() {
        loadViewIfNeeded()
        title = snippet?.name ?? "New Snippet"
        textView.text = snippet?.content ?? ""
    }

    var sourceCodeTheme: SourceCodeTheme {
        if UIApplication.activeTraitCollection.userInterfaceStyle == .dark {
            return DarkTheme()
        } else {
            return LightTheme()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.theme = sourceCodeTheme
        textView.delegate = self

        // Attach a toolbar with common key symbols to make typing easier.
        textView.contentTextView.inputAccessoryView = UIView.editingToolbar(target: self, action: #selector(insertCharacter))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Language", image: nil, primaryAction: nil, menu: languageMenu)


    }

    /// Called when the user taps a key symbol in our input accessory view.
    @objc func insertCharacter(_ sender: UIBarButtonItem) {
        guard let value = UnicodeScalar(sender.tag) else { return }
        let string = String(value)
        textView.insertText(string)
        UIDevice.current.playInputClick()
    }
   
}

extension DetailViewController: SnippetSelectionDelegate {
    func snippetSelected(_ newSnippet: Snippet) {
        snippet = newSnippet
    }
}

extension DetailViewController: SyntaxTextViewDelegate {
    /// Send back our Swift lexer for this source code.
    func lexerForSource(_ source: String) -> Lexer {
        if(self.language == "swift"){
            return lexer
        }else{
            return lexerPython
        }
            
        
    }
}
