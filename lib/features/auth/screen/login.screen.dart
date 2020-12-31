import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/core/widget/toast.custom.dart';
import 'package:nelongso_app/features/auth/bloc/login_bloc.dart';
import 'package:nelongso_app/features/home/routes/home.route.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: LoginContent(),
    );
  }
}

class LoginContent extends StatefulWidget {
  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final LoginBloc _bloc = LoginBloc();

  TextEditingController _emailController =
      TextEditingController(text: 'admin@demo.com');
  TextEditingController _passwordController =
      TextEditingController(text: 'password');

  bool _isRememberMe = false;

  final _formKey = GlobalKey<FormState>();

  void _onRememberMeChanged(bool newValue) {
    setState(
      () {
        _isRememberMe = newValue;
      },
    );
  }

  void onPressForgotPassword() {
    print('onPressForgotPassword');
  }

  void onPressLogin() {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Processing Data'),
      //   ),
      // );
      // RouteConfigHome.navigateToHome(context);

      _bloc.add(OnLoginEvent(
          email: _emailController.text, password: _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBloc();
  }

  Widget buildBloc() {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ToastCustom(context).showDefault(msg: state.message);
          }
          if (state is LoginLoaded) {
            ToastCustom(context).showDefault(msg: 'Login Berhasil...');
            
            RouteConfigHome.navigateToHome(context);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(child: LoadingPageIndicator());
            }else {
              return formInput();
            }
          },
        ),
      ),
    );
  }

  Widget formInput() {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          height: SizeConfig.heightMultiplier * 60,
          width: SizeConfig.widthMultiplier * 95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Icon(
                  Icons.person,
                  size: SizeConfig.imageSizeMultiplier * 28,
                  color: Colors.white,
                ),
              ),
              // Text('Username'),
              textInputCustom('Email', _emailController, null),
              textInputCustom('Password', _passwordController, 'password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isRememberMe,
                        onChanged: _onRememberMeChanged,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => onPressForgotPassword(),
                  ),
                ],
              ),
              InkWell(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () => onPressLogin(),
              ),
              // Text('Create Account Mitra')
            ],
          ),
        ),
      ),
    );
  }

  Widget textInputCustom(
      String _label, TextEditingController _controller, String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        obscureText: type == 'password' ? true : false,
        controller: _controller,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some ${_label.substring(0, 1).toUpperCase()}${_label.substring(1).toLowerCase()}';
          }
          return null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: _label,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          errorStyle: TextStyle(
            color: Colors.red[100],
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[200],
              width: 1.5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
