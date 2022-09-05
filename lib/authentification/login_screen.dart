import  'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaay_livre/authentification/signup_screen.dart';
import 'package:kaay_livre/global/global.dart';
import 'package:kaay_livre/splashScreen/splash_screen.dart';
import 'package:kaay_livre/widgets/progress_dialog.dart';


class LoginScreen extends StatefulWidget
{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}




class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  
  bool isHiddenpassword = true;


  validateForm()
  {
    if(!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "L'adresse email n'est pas valide.");
    }
    else if(passwordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Mot de passe requis.");
    }
    else
    {
      loginDriverNow();
    }
  }

  loginDriverNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Traitement en cours, veuillez patienter...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(firebaseUser.uid).once().then((driverKey)
      {
        final snap = driverKey.snapshot;
        if(snap.value != null)
        {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Connexion réussie.");
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
        }
        else
        {
          Fluttertoast.showToast(msg: "Aucun enregistrement n'existe avec cet e-mail.");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
        }
      });
    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Une erreur s'est produite lors de la connexion.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/logo.jpeg"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Se connecter (livreurs)",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.white,),
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
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: isHiddenpassword,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  hintText: "Mot de passe",
                  prefixIcon: Icon(Icons.lock, color: Colors.white,),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        isHiddenpassword = !isHiddenpassword;
                      });
                    },
                    child: isHiddenpassword ? Icon(Icons.visibility_off, color: Colors.white,):
                    Icon(Icons.visibility, color: Colors.white,),
                  ),
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

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: ()
                {
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Connexion",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),

              TextButton(
                child: const Text(
                  "Vous n'avez pas de compte? Inscrivez-vous ici",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}