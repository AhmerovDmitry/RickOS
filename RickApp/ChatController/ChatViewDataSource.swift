import UIKit

extension ChatViewController: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatViewCell
        cell.cellLabel.bounds.size = cell.cellText.bounds.size
        cell.bounds.size.height = 100
        cell.cellText.text = messages[indexPath.row]
        cell.backgroundColor = .clear
        cell.cellLabel.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToBot), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func scrollToBot(notification: Notification) {
        if messages.count >= 1 {
            self.tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        UIView.animate(withDuration: 2.5, animations: {
            self.view.frame.size.height = UIScreen.main.bounds.height - 271
            self.view.layoutIfNeeded()
        })
    }
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 2.5, animations: {
            self.view.frame.size.height = UIScreen.main.bounds.height
            self.view.layoutIfNeeded()
        })
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }
}
