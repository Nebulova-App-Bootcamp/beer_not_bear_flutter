import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFF000000).withOpacity(0.5),
              width: 2.0, // Underline thickness
            ))),
            padding: EdgeInsets.only(top: 50, right: 39, left: 39),
            child: Text(
              "TERMINOS Y CONDICIONES",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et aliquet mauris, sed egestas erat. Integer ex ex, auctor quis justo id, bibendum rutrum justo. Nulla a luctus dolor, et pharetra nisl. Praesent sollicitudin ipsum vel massa malesuada imperdiet. Suspendisse id hendrerit leo. Fusce ut sodales dui. Etiam neque orci, eleifend et ligula nec, tempor porttitor nunc. Nunc fringilla non arcu a condimentum. Cras dictum libero iaculis, faucibus tellus sit amet, gravida nisl. Nulla fringilla condimentum purus, et sodales enim porta nec. Quisque dignissim quis erat ac imperdiet. Integer ultrices elit ac neque pulvinar efficitur. Donec iaculis est ut quam efficitur, sed sagittis ipsum tempus. Nulla eget imperdiet purus. Nunc in magna id nibh rhoncus dignissim.Quisque sed sapien ac erat egestas maximus. Sed pretium magna eros, et consequat eros sagittis ac. Aliquam viverra tellus in gravida feugiat. Fusce tristique pretium felis ac commodo. Suspendisse ex risus, pharetra quis consectetur quis, euismod id dolor. Nam venenatis vestibulum risus a auctor. Donec faucibus neque a dui dapibus ultrices. Suspendisse erat sem, tincidunt in gravida et, pulvinar sit amet justo. Aliquam ultricies a tellus et dapibus. Aenean mattis turpis at arcu interdum, vel ultrices neque suscipit. Etiam lacus odio, lacinia sed aliquet ac, porta eu magna. Nam at facilisis justo, ut scelerisque libero. Cras condimentum justo et efficitur consectetur. Integer sed augue in mauris vehicula aliquam eget vel lacus. Sed ac dolor a nisl sollicitudin suscipit eget quis justo. Aliquam erat volutpat."),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et aliquet mauris, sed egestas erat. Integer ex ex, auctor quis justo id, bibendum rutrum justo. Nulla a luctus dolor, et pharetra nisl. Praesent sollicitudin ipsum vel massa malesuada imperdiet. Suspendisse id hendrerit leo. Fusce ut sodales dui. Etiam neque orci, eleifend et ligula nec, tempor porttitor nunc. Nunc fringilla non arcu a condimentum. Cras dictum libero iaculis, faucibus tellus sit amet, gravida nisl. Nulla fringilla condimentum purus, et sodales enim porta nec. Quisque dignissim quis erat ac imperdiet. Integer ultrices elit ac neque pulvinar efficitur. Donec iaculis est ut quam efficitur, sed sagittis ipsum tempus. Nulla eget imperdiet purus. Nunc in magna id nibh rhoncus dignissim.Quisque sed sapien ac erat egestas maximus. Sed pretium magna eros, et consequat eros sagittis ac. Aliquam viverra tellus in gravida feugiat. Fusce tristique pretium felis ac commodo. Suspendisse ex risus, pharetra quis consectetur quis, euismod id dolor. Nam venenatis vestibulum risus a auctor. Donec faucibus neque a dui dapibus ultrices. Suspendisse erat sem, tincidunt in gravida et, pulvinar sit amet justo. Aliquam ultricies a tellus et dapibus. Aenean mattis turpis at arcu interdum, vel ultrices neque suscipit. Etiam lacus odio, lacinia sed aliquet ac, porta eu magna. Nam at facilisis justo, ut scelerisque libero. Cras condimentum justo et efficitur consectetur. Integer sed augue in mauris vehicula aliquam eget vel lacus. Sed ac dolor a nisl sollicitudin suscipit eget quis justo. Aliquam erat volutpat."),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFB449))),
                child: const Text(
                  "CERRAR",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
