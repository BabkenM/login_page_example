import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:viveohealthtask/src/paints/customPainter.dart';
import 'package:viveohealthtask/src/popups/warningDialog.dart';
import 'package:viveohealthtask/src/store/login/login.dart';
import 'package:viveohealthtask/src/widgets/customIndicator.dart';
import 'package:viveohealthtask/src/widgets/loadingIndicator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  /// Loading indicator handler
  LoadingIndicator _loadingIndicator;

  /// [TabBarView] controller
  TabController _tabController;

  /// Variable for accessing [AppThemes]
  ThemeData _theme;

  /// Will hold device screen height and width
  double _height;

  LoginForm _loginMob = LoginForm();

  String _userNameValue;
  String _passwordValue;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_theme == null) {
      _height = MediaQuery.of(context).size.height;
      _theme = Theme.of(context);
      _loadingIndicator = LoadingIndicator(context: context);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: _logo(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: _body(),
      ),
    );
  }

  _logo() {
    return Container(
      padding: EdgeInsets.only(
          left: 20,
          top: 30
      ),
      child: Text(
        'BRAND \nLOGO',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _backgroundPaint(),
          _loginForm()
        ],
      ),
    );
  }

  _backgroundPaint() {
    return CustomPaint(
      child: Container(
        height: _height / 3,
      ),
      painter: CurvePainter(),
    );
  }

  _loginForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 30,
        right: 40,
        left: 40,
      ),
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Container(
        height: _height,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _userNameField(),
                  _passwordField(),
                  _loginSignUp(),
                  _forgotPassword()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _userNameField() {
    return Observer(
      builder:  (_) => TextFormField(
        onChanged: (value) => _userNameValue = value,
        cursorColor: _theme.accentColor,
        style: _theme.primaryTextTheme.subhead,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (_){
          _submitForm(_tabController.index);
        },
        decoration: InputDecoration(
            hintText: 'Username',
            errorText: _loginMob.userNameError
        ),
      ),
    );
  }

  _passwordField() {
    return Observer(
      builder:  (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: TextFormField(
          onChanged: (value) => _passwordValue = value,
          cursorColor: _theme.accentColor,
          style: _theme.primaryTextTheme.subhead,
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (_){
            _submitForm(_tabController.index);
          },
          decoration: InputDecoration(
              hintText: 'Password',
              errorText: _loginMob.passwordError,
            errorMaxLines: 2
          ),
        ),
      ),
    );
  }

  _loginSignUp() {
    return Material(
      color: Color(0xff213446),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: Color(0xff213446),
        child: TabBar(
            onTap: _submitForm,
            labelStyle: _theme.primaryTextTheme.button,
            unselectedLabelColor: Colors.white30,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: CustomTabIndicator(),
            tabs: <Tab>[
              Tab(
                text: 'Login',
              ),
              Tab(
                text: 'Sign-up',
              ),
            ]),
      ),
    );
  }

  _forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
          onPressed: (){

          },
          child: Text('Forgot Password?',
            style: _theme.primaryTextTheme.caption,
          )
      ),
    );
  }

  void _submitForm(int index){
    if(!_tabController.indexIsChanging && index == 0){
      _loginMob.submitForm(
          password: _passwordValue,
          userName: _userNameValue
      ).then((result){
        if(result){
          _loadingIndicator.openLoadingScreen();
          Future.delayed(Duration(seconds: 2)).then((_){
            _loadingIndicator.closeLoadingScreen();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return WarningDialog(message: 'You logged in');
              },
            );
          });
        }
      });
    }
  }
}