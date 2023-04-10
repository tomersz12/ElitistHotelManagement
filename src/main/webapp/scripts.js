//Customer Log in Button

const customerButton = document.getElementById('userLogin');

customerButton.addEventListener("click", () =>{
	const userForm = document.getElementById('userForm');
	
	if (userForm.style.display == 'block'){
		userForm.style.display = 'none';
	}else{
		userForm.style.display = 'block';
	}
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

//Date

n =  new Date();
y = n.getFullYear();
m = n.getMonth() + 1;
d = n.getDate();

document.getElementById("date").innerHTML = y + "-" + m + "-" + d;