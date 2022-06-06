import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget
{

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}


class _CarInfoScreenState extends State<CarInfoScreen>
{
  TextEditingController carModelTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 24,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("images/logo1.png"),
            ),


            const SizedBox(height: 10,),

            const Text(
              "Write Car Details",
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: nameTextEditingController,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: const InputDecoration(
                labelText: "Car Model",
                hintText: "Car Model",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

            ),

            TextField(
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Email",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

            ),

            TextField(
              controller: phoneTextEditingController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: const InputDecoration(
                labelText: "Phone",
                hintText: "Phone",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

            ),

          ],
        ),

      ),
    );
  }
}
