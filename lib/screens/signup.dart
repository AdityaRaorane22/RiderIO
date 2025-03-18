import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  String? selectedGender;
  String? selectedCountry = "India"; // Default country

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create an Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              
              // Full Name
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration("Full Name", Icons.person),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 10),

              // Date of Birth
              TextFormField(
                controller: _dobController,
                decoration: _inputDecoration("Date of Birth", Icons.calendar_today),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) => value!.isEmpty ? "Select your birth date" : null,
              ),
              SizedBox(height: 10),

              // Gender
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Gender", Icons.wc),
                value: selectedGender,
                items: ["Male", "Female", "Other"].map((String gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) => setState(() => selectedGender = value),
                validator: (value) => value == null ? "Select your gender" : null,
              ),
              SizedBox(height: 10),

              // Address
              TextFormField(
                decoration: _inputDecoration("Address", Icons.home),
                validator: (value) => value!.isEmpty ? "Enter your address" : null,
              ),
              SizedBox(height: 10),

              // City & State (Row Layout)
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: _inputDecoration("City", Icons.location_city),
                      validator: (value) => value!.isEmpty ? "Enter city" : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: _inputDecoration("State", Icons.map),
                      validator: (value) => value!.isEmpty ? "Enter state" : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Country
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Country", Icons.public),
                value: selectedCountry,
                items: ["India", "USA", "UK", "Canada", "Australia"].map((String country) {
                  return DropdownMenuItem(value: country, child: Text(country));
                }).toList(),
                onChanged: (value) => setState(() => selectedCountry = value),
              ),
              SizedBox(height: 10),

              // Mobile Number
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration("Mobile Number", Icons.phone),
                validator: (value) {
                  if (value!.isEmpty) return "Enter your phone number";
                  if (value.length != 10) return "Enter a valid 10-digit number";
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _inputDecoration("Password", Icons.lock),
                validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
              ),
              SizedBox(height: 10),

              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: _inputDecoration("Confirm Password", Icons.lock),
                validator: (value) => value != _passwordController.text ? "Passwords do not match" : null,
              ),
              SizedBox(height: 20),

              // Signup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to Login
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
              ),
              
              SizedBox(height: 10),
              
              // Login Redirect
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Already have an account? Log in", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input Field Decoration
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  // Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
