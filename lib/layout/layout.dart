import 'package:app/shared/items/widgets.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:flutter/material.dart';

class AppLayOut extends StatelessWidget {
  const AppLayOut(
      {super.key,
      this.leading,
      required this.header,
      required this.dis,
      this.fields});
  final Widget? leading, fields;
  final String header, dis;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // page header
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        header,
                        style: AppStyles.large(),
                      ),
                    ],
                  ),
                  freev(v: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Text(
                        dis,
                        style: AppStyles.light(),
                      ),
                    ),
                  ),
                ],
              ),
              freev(v: 45),
              //fields
              fields ?? const SizedBox(),
              freev(v: 45),
              //bottom
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      line(context),
                      freeh(h: 10),
                      Text(
                        'Or',
                        style: AppStyles.light(),
                      ),
                      freeh(h: 10),
                      line(context),
                    ],
                  ),
                  freev(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      box('images/Facebook_logo_(square).png'),
                      box('images/Instagram-Icon.png')
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*



   AppLayout()

 */