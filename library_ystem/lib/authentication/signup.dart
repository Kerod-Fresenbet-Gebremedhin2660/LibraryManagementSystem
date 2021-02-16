import 'package:flutter/material.dart';
import 'package:library_ystem/authentication/login.dart';
import 'package:library_ystem/constants.dart/constants.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name;
  String _email;
  String _password;
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime birthDate; // instance of DateTime
  String birthDateInString;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildName() {
    return TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: mainColor,
            ),
            labelText: 'Name'));
  }

  Widget _buildEmail() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: mainColor,
          ),
          labelText: 'E-mail'),
    );
  }

  

  Widget _buildPassword() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ));
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password Must be confirmed';
          }
          // if (!(value == _password)) {
          //   return 'Password did Not match';
          // }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'ConfirmPassword',
        ));
  }

  Widget _buildBirthdate() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(14),
          child: new Icon(Icons.calendar_today)),
          onTap: () async {
            final datePick = await showDatePicker(
                context: context,
                initialDate: new DateTime.now(),
                firstDate: new DateTime(1900),
                lastDate: new DateTime(2100));
            if (datePick != null && datePick != birthDate) {
              setState(() {
                birthDate = datePick;
                isDateSelected = true;

                // put it here
                birthDateInString =
                    "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
              });
            }
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ዋሸራ"),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // _buildLogo(),
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildConfirmPassword(),
                //_buildBirthdate(),
                // SizedBox(height: 10),
                RaisedButton(
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(color: sixthColor, fontSize: 16),
                  ),
                  onPressed: () {
                    // if (!_formKey.currentState.validate()) {
                    //   return 
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> Authentication()));
                    //}
                    _formKey.currentState.save();
                    print(_name);
                    print(_email);
                    print(_password);
                    print(birthDateInString);

                    //Send to API
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Container();
// }
