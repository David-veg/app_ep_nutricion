import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:app_nutricion_ep/src/pages/login/login_controller.dart';
import 'package:app_nutricion_ep/src/utils/constants/my_colors.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('INIT STATE');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print('SCHEDULER BINDING');
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    print('METOSO BUILD');

    return Scaffold(
        backgroundColor: Color.fromRGBO(2, 48, 82, 1),
      body: Container(

        width:double.infinity,

        child: 
        SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _imageBanner(),
              _textFieldUsername(),
              _textFieldPassword(),
              _buttonLogin(),
              _textFieldFooter()
            ],
          ),
        ),
      )
    );
  }

  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
          top: 100,
          bottom: MediaQuery.of(context).size.height * 0.15
      ),
      child: Image.asset(
        'assets/logos/logo.png',

        width: 200,
        height: 200,
      ),
    );
  }

  Widget _textFieldUsername(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical:10),
      decoration: BoxDecoration(
        color: MyColors.secondaryColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.usernameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
            color: MyColors.txtprimaryColor,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: MyColors.primaryColor,
          )
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 50, vertical:10),
      decoration: BoxDecoration(
          color: MyColors.secondaryColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
            color: MyColors.txtprimaryColor,
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: MyColors.primaryColor,
        )
       ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: _con.login,
          child: Text('INGRESAR'),
        style: ElevatedButton.styleFrom(
          primary: MyColors.dangerDarkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  Widget _textFieldFooter(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nutrición Humana',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        Text(
            'UpeU'
        ),
      ],
    );
  }
}
