import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('RegisterView'),
      //   centerTitle: true,
      // ),

      body: ListView(
          children: [Form(
            key: controller.formKey,
            child: Column(
                children: [

                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFF080ba1),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.0
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    alignment:Alignment.center,
                    child: const Text(
                      'Silakan buat akun Anda untuk menikmati akses penuh ke koleksi digital kami.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.7,
                        fontSize: 16.0,
                        color: Color(0xFF61677D),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    child: Column(
                      children: [

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Nama',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.namaController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Nama',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Nama tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Username tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Telepon',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.teleponController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Telepon',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Telepon tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Alamat',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.alamatController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Alamat',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Alamat tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Password tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        Obx(() => controller.loadingregister.value?
                        CircularProgressIndicator():
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: (){
                              controller.postRegister();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                              ),
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF080ba1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                        )
                      ],
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
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: const Text(
                            'Sign In',
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


                ]
            ),
          )]
      ),

    );
  }
}
