import 'package:beer_not_bear_flutter/pages/login_register.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      next: const Icon(Icons.arrow_forward),
      skip: const Text("Skip"),
      done: const Text("Done"),
      nextColor: Colors.white,
      skipColor: Colors.white,
      doneColor: Colors.white,
      globalBackgroundColor: const Color(0xFF434343),
      dotsDecorator: const DotsDecorator(activeColor: Colors.white),
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginRegister()));
      },
      onSkip: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginRegister()));
      },
      pages: [
        PageViewModel(
            reverse: true,
            title: "Bienvenido",
            body: "Al mundo de la cerveza",
            footer: Container(
              padding: const EdgeInsets.only(top: 89),
              child: Column(
                children: [
                  Image.asset("assets/image/introLogo.png"),
                  const Padding(
                      padding: EdgeInsets.only(top: 11),
                      child: Text(
                        "Remember: BeerNotBear",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ))
                ],
              ),
            ),
            decoration: const PageDecoration(
              titlePadding: EdgeInsets.only(top: 104, bottom: 11),
              titleTextStyle: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              pageColor: Color(0xFF434343),
            )),
        PageViewModel(
            title: "Frases Celebres",
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                sentences("“La cerveza es la maldita mejor bebida del mundo“"),
                writer("– Jack Nicholson"),
                const SizedBox(height: 20),
                sentences(
                    "“La cerveza es siempre la respuesta, hasta que olvides la pregunta“"),
                writer("– Anónimo"),
                const SizedBox(height: 20),
                sentences("“Quien inventó la cerveza, fue un hombre sabio“"),
                writer("– Platón"),
                const SizedBox(height: 20),
                sentences(
                    "“La cerveza es la causa y la solución de todos los problemas de la vida“"),
                writer("– Homer Simpson"),
                const SizedBox(height: 20),
                sentences(
                    "“El que bebe cerveza se duerme temprano; el que duerme mucho no peca; quien no peca, entra al Paraíso. ¡Así que bebamos cerveza!“"),
                writer("– Martin lutero"),
              ],
            ),
            footer: Container(
                padding: const EdgeInsets.only(top: 35),
                child: Image.asset("assets/image/introLogo2.png")),
            decoration: const PageDecoration(
              titlePadding: EdgeInsets.only(top: 70, bottom: 32),
              titleTextStyle: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              pageColor: Color(0xFF434343),
            )),
      ],
    );
  }

  Widget sentences(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    );
  }

  Widget writer(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 54, right: 30),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    );
  }
}
