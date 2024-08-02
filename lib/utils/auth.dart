import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
/*import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;
 */

class Authentication {
  //initialize fire base
  static Future<FirebaseApp> fireBaseInit() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    //will enter the login logic
    return firebaseApp;
  }

  //google sign in 'ogic
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    //make an object from firebase authenticaion
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    //make an abject from google user account
    User? user;

    //make an object from GoogleSignIn to can authenticate google users
    final GoogleSignIn googleSignIn = GoogleSignIn();

    //make an object from GoogleSignInAccount to hold all accounts that matching with user id
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      //after signing in hold the authentication token of specific user
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      //Create a new [GoogleAuthCredential] from a provided [accessToken].
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      if (kDebugMode) {
        print(
            'access token<> ${googleSignInAuthentication.accessToken} : tokenid<> ${googleSignInAuthentication.idToken}');
      }
      try {
        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          //to handle
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          //to handle
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign-In. Try again.',
            ),
          );
          if (kDebugMode) {
            print("Error: $e");
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
        if (kDebugMode) {
          print("Error: $e");
        }
      }
    }
    return user;
  }

  //sign out
  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black.withOpacity(.5),
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<User?> signInWithFacebookAuth(context) async {
    //make an object from firebase authenticaion
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    User? user;
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(facebookAuthCredential);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Facebook Sign-In. Try again.',
        ),
      );
      if (kDebugMode) {
        print("Error: $e");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Facebook Sign-In. Try again.',
        ),
      );
      if (kDebugMode) {
        print("Another Error: $e");
      }
    }
    return user;
  }
}

  /* static Future<User?> signInWithFacebook(context) async {
    //make an object from firebase authenticaion
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    //make an abject from google user account
    UserCredential? user;
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      user = await firebaseAuth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Facebook Sign-In. Try again.',
        ),
      );
      if (kDebugMode) {
        print("Error: $e");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Facebook Sign-In. Try again.',
        ),
      );
      if (kDebugMode) {
        print("Another Error: $e");
      }
    }
    return user?.user;
  } */



/* 
 
  
        if (currentUser != null) {  
            Log.d(TAG, "Currently Signed in: " + currentUser.getEmail());  
            Toast.makeText(MainActivity.this, "Currently Logged in: " + currentUser.getEmail(), Toast.LENGTH_LONG).show();  
        }  
    }  
    @Override  
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {  
        super.onActivityResult(requestCode, resultCode, data);  
  
        // The activity result pass back to the Facebook SDK  
        mCallbackManager.onActivityResult(requestCode, resultCode, data);  
    }  
  
    private void handleFacebookAccessToken(AccessToken token) {  
        Log.d(TAG, "handleFacebookAccessToken:" + token);  
  
        AuthCredential credential = FacebookAuthProvider.getCredential(token.getToken());  
  
        mAuth.signInWithCredential(credential)  
                .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {  
                    @Override  
                    public void onComplete(@NonNull Task<AuthResult> task) {  
                        if (task.isSuccessful()) {  
                            // Sign in success, UI will update with the signed-in user's information  
                            Log.d(TAG, "signInWithCredential:success");  
                            FirebaseUser user = mAuth.getCurrentUser();  
                            Toast.makeText(MainActivity.this, "Authentication Succeeded.", Toast.LENGTH_SHORT).show();  
                        } else {  
                            // If sign-in fails, a message will display to the user.  
                            Log.w(TAG, "signInWithCredential:failure", task.getException());  
                            Toast.makeText(MainActivity.this, "Authentication failed.", Toast.LENGTH_SHORT).show();  
                        }  
                    }  
                });  
    }  
}   */