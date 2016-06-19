/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	View controller which controls dialing an outgoing call
*/

import UIKit

class DialOptionsViewController: UIViewController {

    @IBOutlet private weak var destinationTextField: UITextField!
    @IBOutlet private weak var dialButton: UIBarButtonItem!

    var destination: String? {
        return destinationTextField?.text
    }

    // MARK: Actions

    @IBAction func cancel(_ cancel: UIBarButtonItem?) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Helpers

    private func updateDialButton() {
        guard let destination = destination else {
            dialButton?.isEnabled = false
            return
        }

        dialButton?.isEnabled = !destination.isEmpty
    }

    // MARK: Observers

    func textFieldDidChange(textField: UITextField?) {
        updateDialButton()
    }
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.prompt = NSLocalizedString("DIAL_OPTIONS_NAVIGATION_PROMPT", comment: "Navigation item prompt for Dial options UI")

        updateDialButton()

        destinationTextField?.addTarget(self, action: #selector(textFieldDidChange), for: [.editingChanged])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        destinationTextField?.becomeFirstResponder()
    }

}
