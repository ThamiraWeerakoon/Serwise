var value=[
    "Alfa Romeo",
    "Aston Martin",
    "Audi",
    "Bentley",
    "BMW",
    "Cadillac",
    "Chevrolet",
    "Chrysler",
    "Dacia",
    "Daewoo",
    "Daihatsu",
    "Dodge",
    "Donkervoort",
    "DS",
    "Ferrari",
    "Fiat",
    "Fisker",
    "Ford",
    "Honda",
    "Hummer",
    "Hyundai",
    "Infiniti",
    "Iveco",
    "Jaguar",
    "Jeep",
    "Kia",
    "Lamborghini",
    "Land Rover",
    "Lexus",
    "Lotus",
    "Maserati",
    "Maybach",
    "Mazda",
    "McLaren",
    "Mercedes-Benz",
    "MG",
    "Mini",
    "Mitsubishi",
    "Nissan",
    "Peugeot",
    "Porsche",
    "Renault",
    "Rolls-Royce",
    "Rover",
    "Skoda",
    "SsangYong",
    "Subaru",
    "Suzuki",
    "Tesla",
    "Toyota",
    "Volkswagen",
    "Volvo","Ashok Layland","TVS","Bajaj","Piaggio"
];
var brandSelect=document.getElementById("selectbrand");
for (var i=value.length;i--;){
    var optionElem = document.createElement('option');
    optionElem.setAttribute('value', value[i]);
    var optionText = document.createTextNode(value[i]);
    optionElem.appendChild(optionText);
    brandSelect.appendChild(optionElem);
}