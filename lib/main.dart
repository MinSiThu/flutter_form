import 'package:flutter/material.dart';

void main() => runApp(new FormApp());

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Form App", debugShowCheckedModeBanner: false, home: FormPage());
  }
}

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormPageState();
  }
}

class FormPageState extends State<FormPage> {
  var _email;
  var _password;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _login(context) {
    var snackBar = SnackBar(content: Text("Login Success : $_email, $_password"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submitForm(context) {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Form Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(2),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (val) =>
                        !val.contains("@") ? "Invalid Email" : null,
                    onSaved: (val) => _email = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (val) =>
                        val.length < 6 ? "Password Too Short" : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                  SizedBox(height:20),
                  ElevatedButton(onPressed: ()=>_submitForm(context), child: Text("Login"))
                ],
              ),
            ),
          ),
        ));
  }
}
