import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kaay_livre/global/global.dart';

class PushNotificationSystem
{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initializeCloudMessaging() async
  {
    //1. Terminated
    //when the app is completely closed and opened directly from the push notification
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
      {
        print("This is Ride Request Id :: ");
        print(remoteMessage.data["rideRequestId"]);
        //display ride request information - user information who request a ride
      }

    });


    //2. Foreground
    //When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage)
    {
      print("This is Ride Request Id :: ");
      print(remoteMessage!.data["rideRequestId"]);
      //display ride request information - user information who request a ride
    });

    //3. Background
    //when the app is in the background and opened directly from the push notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage)
    {
      print("This is Ride Request Id :: ");
      print(remoteMessage!.data["rideRequestId"]);
      //display ride request information - user information who request a ride
    });

  }

  Future generateAndGetToken() async
  {
    String? registrationToken = await messaging.getToken();
    print("FCM Registration Token: ");
    print(registrationToken);

    FirebaseDatabase.instance.ref().
        child("drivers")
        .child(currentFirebaseUser! .uid)
        .child("Token")
        .set(registrationToken);

    messaging.subscribeToTopic("allDrivers");
    messaging.subscribeToTopic("allUsers");
  }
}