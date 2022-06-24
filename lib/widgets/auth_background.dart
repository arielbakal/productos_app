import 'package:flutter/material.dart';

class AuthBackgorund extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

          _PurpleBox()

        ],
      )
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width:  double.infinity,
      height: size.height * 0.4,
      decoration: _prupleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20)
        ],
      )
    );
  }

BoxDecoration _prupleBackground() => const BoxDecoration(
  gradient: LinearGradient(
    colors: [  
      Color.fromRGBO(63, 63, 156, 1),
      Color.fromRGBO(63, 63, 156, 1),
    ]          
    )
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.25)
      ),
    );
  }
}