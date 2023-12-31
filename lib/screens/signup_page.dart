import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_pro/auth_controller.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<String> img = [
      'Assests/images/g.png',
      "Assests/images/t.png",
      "Assests/images/f.png",
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          width: w,
          height: h * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'Assests/images/signup.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.16,
              ),
              CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 50,
                backgroundImage: AssetImage(
                  'Assests/images/profile1.png',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ]),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ]),
                child: TextField(
                  // get password
                  controller: passwordController,
                  obscureText: true,
                  ////

                  decoration: InputDecoration(
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: h * 0.03,
        ),
        GestureDetector(
          onTap: () {
            AuthController.instance.register(
                emailController.text.trim(), passwordController.text.trim());
          },
          child: Container(
            width: w * 0.5,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'Assests/images/loginbtn.png',
                ),
              ),
            ),
            child: Center(
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: h * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
            text: "Have an account?",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[500],
            ),
          ),
        ),
        SizedBox(
          height: h * 0.04,
        ),
        RichText(
          text: TextSpan(
            text: "Sign up using one of the following method",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
            ),
          ),
        ),
        Wrap(
          children: List<Widget>.generate(
            3,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[500],
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      img[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
