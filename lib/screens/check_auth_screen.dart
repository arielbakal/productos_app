import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false); 

    return Scaffold(
      body: Center(
         child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            if ( !snapshot.hasData )
              return Text('');
            
            Future.microtask(() {
              
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: ( _ , __ , ___ ) => HomeScreen(),
                transitionDuration: Duration( seconds: 0 )
                )
              );
              //Navigator.of(context).pushReplacementNamed('login');
            });
            

            return Container();
          }
        ),
      ),
    );
  }
}