//Customer Log in Button

const customerButton = document.getElementById('userLogin');

customerButton.addEventListener("click", () =>{
	const userForm = document.getElementById('userForm');
	
	if (userForm.style.display == 'block'){
		userForm.style.display = 'none';
	}else{
		userForm.style.display = 'block';
	}
	console.log("button works!");
});

//Employee Log in Button
const employeeButton = document.getElementById('employeeLogin');

employeeButton.addEventListener("click", () =>{
	const employeeForm = document.getElementById('employeeForm');
	
	if (employeeForm.style.display == 'block'){
		employeeForm.style.display = 'none';
	}else{
		employeeForm.style.display = 'block';
	}
});
