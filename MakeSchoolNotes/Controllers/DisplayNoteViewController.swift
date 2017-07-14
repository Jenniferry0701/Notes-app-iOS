//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if let note = note
        {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }
        else
        {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }    //Do we need to call it? Recall that the viewWillAppear() method is called immediately before the view appears on screen

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier
        {
            if identifier == "cancel"
            {
                print("Cancel button tapped")
            }
            else if identifier == "save"
            {
//                guard let listNotesTableViewController = segue.destination as?                                ListNotesTableViewController
//                else
//                {
//                    return
//                }
                print("Save button tapped")
                // if note exists, update title and content
                let note = self.note ?? CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                CoreDataHelper.saveNote()
            }
        }
    }
}

