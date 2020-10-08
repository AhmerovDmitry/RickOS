import UIKit

class ImagePickerController: UIViewController {
    weak var delegate: BaseViewControllerDelegate?
    
    let imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        return imagePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imagePicker.view)
        
        imagePicker.delegate = self
    }
}

extension ImagePickerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            self.delegate?.update(avatar: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.delegate?.update(avatar: originalImage)
        }
        dismiss(animated: true, completion: nil)
    }
}
