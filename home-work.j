function sayHi() {
    for (var i=0; i<arguments.length; i++) {
        alert("Hi", + arguments[i]);
    }
}
sayHi("Cat", "Alice"); // 'Hi, Cat', then 'Hi, Alice'

//1. implement function add(a,b,c...)
//add(3); //return 3 
//add(3,4) //return 7 
//add(3,4,5) //return 12 

function add(a,b,c) { 
     var total=0; 
     for (var i=0; i<arguments.length; i++) { 
         total += arguments[i]; 
         alert(total);  //noprotect
     }
 } 
 add(3, 4, 5); 
 
 
//2. implement function max(a,b,c...)
//max(3); // returns 3
//max(3, 4);  // returns 4
//max(3, 4, 5);  // returns 5

function max() {
    var biggest;
    for (var i=0; i<arguments.length; i++) {
        if (i===0)
            biggest = arguments[i];
        else {
            if (arguments[i]>biggest) {
               biggest=arguments[i];
            }
        }
  }
  alert(biggest);
}
max(3, 4, 5); // 5

//3. You have the following JavaScript code. Write the appropriate HTML so all three statements are equivalent (will bring the same value).
//document.forms["myForm"].elements["myField"].value
//document.forms[1].elements[1].value
//document.myForm.myField.value

<!DOCTYPE html>
<html>
<head>
<title>Title of the document</title>
</head>
<body>
<form id="myForm">
The content of the document

My Field<input type="text" id="myField">  
</form>
</body>
</html>

//4. Read the API on object String and Array.
//http://docs.sencha.com/extjs/4.2.1/#!/api/String
//http://docs.sencha.com/extjs/4.2.1/#!/api/Array
//Then write a one-line function (less than 80 characters) that returns a boolean indicating 
//whether or not a string is a palindrome. e.g. "A nut for a jar of tuna." is a palindrome. (Java API)
function isPalindrome(x) {
  return(x == x.split('').reverse().join(''));
}
console.log(isPalindrome("anutforajaroftuna"));

//5. Read this article then run the following code in a browser and explain the result.
//http://ryanmorr.com/understanding-scope-and-context-in-javascript/
var myObject = {
    foo: "bar",
    func: function() {
        var self = this;
        console.log("outer func:  this.foo = " + this.foo); //bar
        console.log("outer func:  self.foo = " + self.foo); //bar
        (function() {
             console.log("inner func:  this.foo = " + this.foo); //undefined
             console.log("inner func:  self.foo = " + self.foo); //bar
        })();
    }
};
myObject.func(); 
var test = myObject.func; 
test(); //all undefined -because "this" is undefined

"outer func:  this.foo = bar"
"outer func:  self.foo = bar"
"inner func:  this.foo = undefined"
"inner func:  self.foo = bar"
"outer func:  this.foo = undefined"
"outer func:  self.foo = undefined"
"inner func:  this.foo = undefined"
"inner func:  self.foo = undefined"


//second test
var myObject = {
    foo: "bar",
    func: function() {
        var self = this;
        console.log("outer func:  this.foo = " + this.foo); //bar
        console.log("outer func:  self.foo = " + self.foo); //bar
    }
};
(function() {
             console.log("inner func:  this.foo = " + this.foo); //undefined
             console.log("inner func:  self.foo = " + self.foo); //bar
})();
myObject.func(); 
var test = myObject.func; 
test(); //all undefined -because "this" is undefined

"inner func:  this.foo = undefined"
"inner func:  self.foo = undefined"
"outer func:  this.foo = bar"
"outer func:  self.foo = bar"
"outer func:  this.foo = undefined"
"outer func:  self.foo = undefined"

//6.	Implement the following function. It should return the sum of the two numbers:
//sum(3)(4); // returns 7

var sum = function(x) {
return function(y) {
	return x + y;
	};
};
alert(sum(3)(4)); //7

//7. Tell me what the function below does. Do you see the bug? A: Finding the min number.
function foo(arr) {
    var a1 = -Infinity, a2 = -Infinity;
    arr.forEach(function(num) {
        if (num > Math.min(a1, a2)) {
            if (a1 < a2) {
                a1 = num;
            } else {
                a2 = num;
            }
        }
    });
    return (Math.min(a1, a2)); //should use return (Math.max(a1,a2)); find the max number.
}
console.log(foo([3,1,5,8,9,10]));

function foo1(arr) {
    var a1 = arr[0];
    arr.forEach(function(num) {
        if (num < a1) {
            a1=num;
        }
    });
    return a1;
}

//8. Explain what is MVC
//MVC (Model, View, Controller) MVC is a software architecture - the structure of the system - that separates 
//domain/application/business (whatever you prefer) logic from the rest of the user interface. It does this by 
//separating the application into three parts: the model, the view, and the controller.

//Addrees book
//Challenge:
//Build a mini address book to showcase your JavaScript and DOM talents.

//Objectives:
//- the app will consist of a form with input elements to add new contacts and a multi select element to list them.
//- create input elements so that the user can add a 'name' and a 'telephone' value for a new contact and click 'add' button which adds user to the multi select box.
//    - data in each select option tag can be stored anyway you like - there are many ways, so get creative
//- once contacts exist in the multi-select tag, the user should be able to select and press a 'delete' button to remove multiple at a time
//- add a button to sort contacts by name in the multi select box
//- add another button to sort contacts by telephone in the select box
//
//Bonus: 
//- use additional fields aside from name and telephone and allow sorting on them, ie: last name
//- use native javascript or jquery to generate all DOM elements
//
//Restrictions:
//- the application is to be written in a single index.html file
//- optionally include a single style.css, scripts.js, and just jQuery - no other libraries/framkeworks are permitted

<!DOCTYPE html>
<html>
<body>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script>
	var app = angular.module('addressBook', []);
	app.controller('addressBookControl', function($scope,$http) {
		$scope.submit="Submit";
		$scope.remove="Remove";
		$scope.load="Load";
		$scope.save="Save";
		$scope.error="";
		$scope.persons=[
			{firstName:'Jani',lastName:'Norway',telphone:'416-234-5632'},
			{firstName:'Hege',lastName:'Sweden',telphone:'416-456-1204'},
			{firstName:'Kai',lastName:'Denmark',telphone:'905-237-1208'}];
		$scope.doSubmit = function ($firstName, $lastName, $telphone) {
		    var newPerson = { firstName: $firstName, lastName: $lastName, telphone: $telphone};
			$scope.persons.push(newPerson);
		};
		$scope.doRemove = function ($firstName, $lastName) {
			var i, person;
			for(i = 0; i < $scope.persons.length; i++) {
				person = $scope.persons[i];
				if(person.firstName == $firstName && person.lastName == $lastName) {
					$scope.persons.splice(i,1);
				}
			}
			$scope.person.firstName = "";
			$scope.person.lastName = "";
			$scope.person.telphone = "";
		};
		$scope.doLoad=function() {
			$http.jsonp("data.json").then(function(response) {
				$scope.persons=response.data;
			}, function(response) {
				$scope.error="shit hit the fan";
			});
		};
		$scope.doSave=function() {
			filename='data.json';
			data = JSON.stringify($scope.persons);
			var blob = new Blob([data], {type: 'text/json'}),
				e = document.createEvent('MouseEvents'),
				a = document.createElement('a');

			a.download = filename;
			a.href = window.URL.createObjectURL(blob);
			a.dataset.downloadurl = ['text/json', a.download, a.href].join(':');
			e.initEvent('click', true, false, window,
			  0, 0, 0, 0, 0, false, false, false, false, 0, null);
			a.dispatchEvent(e);
		};
	});
    </script>
<?php
$username = "xianli_gao@hotmail.com";
$password = "411661";
$hostname = "DESKTOP-OC0M6FP"; 

//connection to the database
$dbhandle = mysql_connect($hostname, $username, $password) 
 or die("Unable to connect to MySQL");
echo "Connected to MySQL<br>";

//select a database to work with
$selected = mysql_select_db("AddressBook",$dbhandle) 
  or die("Could not select examples");

//execute the SQL query and return records
$result = mysql_query("SELECT * FROM Employee");

//fetch tha data from the database 
while ($row = mysql_fetch_array($result)) {
   echo "First Name:".$row{'FirstName'}." Last Name:".$row{'LastName'}."Phone No: ". //display the results
   $row{'Phone'}."<br>";
}
//close the connection
mysql_close($dbhandle);
?>

    <div ng-app="addressBook" ng-controller="addressBookControl" name="nameForm">
        <p>First Name: <input type="text" ng-model="person.firstName"></p>
        <p>Last Name: <input type="text" ng-model="person.lastName"></p>
        <p>Telphone: <input type="text" ng-model="person.telphone"></p>

        <table>
            <tr ng-repeat="x in persons | filter : person">
                <td>{{x.firstName}}</td>
                <td>{{x.lastName}}</td>
                <td>{{x.telphone}}</td>
            </tr>
        </table>
        <p>
            <button ng-model="submit" ng-click="doSubmit(person.firstName, person.lastName, person.telphone)">{{submit}}</button>
            <button ng-model="remove" ng-click="doRemove(person.firstName, person.lastName)">{{remove}}</button>
            <button ng-model="load" ng-click="doLoad()">{{load}}</button>
            <button ng-model="save" ng-click="doSave()">{{save}}</button>
        <p>
            <span ng-model="error">{{error}}</span>
    </div>
</body>
</html>
