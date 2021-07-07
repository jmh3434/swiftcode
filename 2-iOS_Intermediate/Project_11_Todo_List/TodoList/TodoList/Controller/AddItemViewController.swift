//
//  AddItemViewController.swift
//  TodoList
//
//  Created by James Hunt on 7/6/21.
//

import UIKit

class AddItemViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var placeholderLabel1 : UILabel = UILabel()
    var placeholderLabel2 : UILabel = UILabel()
    
    var delegate:AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPlaceHolder(textView: titleTextView,placeholderlabel: placeholderLabel1,text: "Add Title")
        addPlaceHolder(textView: descriptionTextView,placeholderlabel: placeholderLabel2, text: "Add Description")
    }
    

    func addPlaceHolder(textView:UITextView, placeholderlabel:UILabel,text:String){
        textView.delegate = self
        placeholderlabel.text = text
        placeholderlabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderlabel.sizeToFit()
        textView.addSubview(placeholderlabel)
        placeholderlabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderlabel.textColor = UIColor.lightGray
        placeholderlabel.isHidden = !textView.text.isEmpty
    }
    
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        
        let item = ToDoItem(title: titleTextView.text, date: datePicker.date, description: descriptionTextView.text)
        delegate?.addItemPressed(by: self, item: item)
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel1.isHidden = !titleTextView.text.isEmpty
        placeholderLabel2.isHidden = !descriptionTextView.text.isEmpty
    }
    
}
