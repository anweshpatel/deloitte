public class PrintMessage {
	public static void main(String[] args){
		Customer c = new Customer();
		c.customerDetails();
	}
}

class Customer {
	public void customerDetails(){
		System.out.println("Customer Details");
		Employee e = new Employee();
		e.employeeDetails();
	}
}

class Employee {
	public void employeeDetails(){
		System.out.println("Employee Details");
	}
}