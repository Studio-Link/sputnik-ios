/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	View controller which controls simulating an call
*/

import UIKit

class SimulateIncomingCallViewController: UIViewController {

    @IBOutlet private weak var destinationTextField: UITextField!
    @IBOutlet private weak var doneButton: UIBarButtonItem!

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
            doneButton?.isEnabled = false
            return
        }

        doneButton?.isEnabled = !destination.isEmpty
    }

    // MARK: Observers

    func textFieldDidChange(textField: UITextField?) {
        updateDialButton()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.prompt = NSLocalizedString("SIMULATE_INCOMING_CALL_NAVIGATION_PROMPT", comment: "Navigation item prompt for Incoming call options UI")

        updateDialButton()

        destinationTextField?.addTarget(self, action: #selector(textFieldDidChange), for: [.editingChanged])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        destinationTextField?.becomeFirstResponder()
    }
    
}
