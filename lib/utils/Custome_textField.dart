import 'package:coffee_store_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_store_ui/pages/SignUp.dart';


class CustomTextField extends StatelessWidget {

  final String label;
  final IconData icon;
  final Function onClick;
  String _errorMassage(String str)
  {
    switch(label)
    {
      case 'Enter your Fname' : return 'Fname Is Empty';
      case 'Enter your Lname' : return 'Lname Is Empty';
      case 'Enter your Email' : return 'Email Is Empty';
      case 'Enter your Password' : return 'Password Is Empty';
      case 'confierm your password' : return 'Confierm Is Empty';
    }
  }
  CustomTextField({@required this.onClick ,@required this.label, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: TextFormField(


validator: (value)
{
  if(value.isEmpty)
    {

      return _errorMassage(label);

    // ignore: missing_return
    }

},
        onChanged: onClick,
        obscureText: label=='Enter your Password'? true: false,



        decoration: InputDecoration(
          filled: true,

          prefixIcon: Icon(icon ,color: Colors.brown[900],),
          labelText: label,

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                  color: Colors.brown[900]
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                  color: Colors.brown[900]
              )
          ),

        ),
      ),
    );
  }
}
