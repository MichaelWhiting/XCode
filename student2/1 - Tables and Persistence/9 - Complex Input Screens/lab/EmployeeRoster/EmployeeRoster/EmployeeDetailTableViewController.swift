
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.textColor = .black
        updateEmployeeType()
        updateView()
        updateSaveButtonState()
    }
    

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    let dobDatePickerIndexPath = IndexPath(row: 2, section: 0)
    let dobDateLabelIndexPath = IndexPath(row: 1, section: 0)
    
    var employeeType: EmployeeType?
    
    var isEditingBirthday: Bool = false {
        didSet {
            dobDatePicker.isHidden = !isEditingBirthday
        }
    }

    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = "\(String(describing: self.employeeType))"
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    func updateEmployeeType() {
        if let employeeType = employeeType {
            employeeTypeLabel.text = "\(employeeType)"
        } else {
            employeeTypeLabel.text = "Select Employee Type"
        }
    }
    
    private func updateSaveButtonState() {
        if employeeType != nil {
            saveBarButtonItem.isEnabled = true
        } else {
            saveBarButtonItem.isEnabled = false
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        guard let employeeType = employeeType else { return }

        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }


    @IBAction func dobDatePickerChanged(_ sender: Any) {
        dobLabel.text = dobDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder, sender: Any?) -> EmployeeTypeTableViewController? {
        let employeeTypeVC = EmployeeTypeTableViewController(coder: coder)
        employeeTypeVC?.delegate = self
        employeeTypeVC?.employeeType = employeeType
        return employeeTypeVC
    }
    
    // MARK: Table View Data & Functions
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            case dobDatePickerIndexPath where isEditingBirthday == false: return 0
            default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            case dobDatePickerIndexPath: return 216
            default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dobDateLabelIndexPath && isEditingBirthday == false {
            isEditingBirthday.toggle()
        } else if indexPath == dobDateLabelIndexPath && isEditingBirthday == true {
            isEditingBirthday.toggle()
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
