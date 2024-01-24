import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Stembook'),
        centerTitle: true,
      ),
      body: Container(
          child: Form(
        key: controller.formKey,
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              width: double.infinity,
              child: Text("Welcome Back Student", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: Text("Username", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: 'Masukan username',  border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'username wajib di isi';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: Text("Password", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: 'Masukan password', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password wajib di isi';
                  }
                  return null;
                },
              ),
            ),
            Obx(() => controller.loadingLogin.value
                ? CircularProgressIndicator()
                :  Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(

                  onPressed: () {
                    controller.login();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text('Login'),
                  ),
            ),
            ),
            ),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun ?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF61677D),
                        letterSpacing: -0.3,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(
                      width: 5.0,
                    ),

                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF080ba1),
                        ),
                      ),
                    )

                  ],
                ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: 140,
                  height: 4,
                  child: ColoredBox(color: Color(0xFF61677D)),
                ),
                Text("OR", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  width: 140,
                  height: 4,
                  child: ColoredBox(color: Color(0xFF61677D)),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
                margin: const EdgeInsets.only(top: 25.0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Expanded(
                      child: SizedBox(
                        height: 45.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFF080ba1),
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              color: Color(0xFF61677D),
                            ),
                          ),
                          onPressed: () {
                            // Tambahkan fungsi untuk tombol Facebook di sini
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 5),

                    Expanded(
                      child: SizedBox(
                        height: 45.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF080ba1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.access_alarms_rounded),
                          label: Text('Google'),
                          onPressed: () {
                            // Tambahkan fungsi untuk tombol Facebook di sini
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      )),
    );
  }
}
