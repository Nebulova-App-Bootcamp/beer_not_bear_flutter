import 'package:beer_not_bear_flutter/pages/login.dart';
import 'package:beer_not_bear_flutter/pages/registrar.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
                  indicatorColor: const Color(0xFFFFB449),
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                        icon: Text("Login",
                            style: Theme.of(context).textTheme.headline1)),
                    Tab(
                        icon: Text("Registrar",
                            style: Theme.of(context).textTheme.headline1)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Login(),
                  Registrar(),
                ],
              ),
            )));
  }
}
