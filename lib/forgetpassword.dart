// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage ({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
 final _email = TextEditingController();
 @override
 void dispose() {
   _email.dispose();
   super.dispose();
 }
//  Future PasswordReset() async{
// try{
//   await FirebaseAuth.instance.sendPasswordResetEmail(
//       email:_email.text.trim());
//   showDialog(
//       context: context,
//       builder:(context) {
//         return AlertDialog(
//           content: Text('Password reset link sent! Go check your email'),
//         );
//       });
// }on FirebaseAuthException catch(e){
//   print(e);
//   showDialog(
//   context: context,
//       builder:(context) {
//     return AlertDialog(
//       content: Text(e.message.toString()),
//     );
//   });
// }
//  }
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text('𝑹𝒆𝒔𝒆𝒕 𝑷𝒂𝒔𝒔𝒘𝒐𝒓𝒅 𝑺𝒄𝒓𝒆𝒆𝒏'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 19,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(47),
            bottomRight: Radius.circular(47),
          )
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 47,),
          Text('𝓟𝓵𝓮𝓪𝓼𝓮 𝓮𝓷𝓽𝓮𝓻 𝔂𝓸𝓾𝓻 𝓮𝓶𝓪𝓲𝓵 𝓲𝓷 𝓸𝓻𝓭𝓮𝓻 𝓽𝓸 𝓰𝓮𝓽 𝓻𝓮𝓼𝓮𝓽 𝓹𝓪𝓼𝓼𝔀𝓸𝓻𝓭 𝓵𝓲𝓷𝓴 𝓯𝓻𝓸𝓶 𝔂𝓸𝓾𝓻 𝓯𝓲𝓻𝓮𝓫𝓪𝓼𝓮 𝓪𝓬𝓬𝓸𝓾𝓷𝓽??'
            ,textAlign: TextAlign.center,
            style:TextStyle(fontWeight: FontWeight.w400, fontSize: 19,) ,),
          SizedBox(height: 47,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,),
            child: TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:  InputDecoration(

                prefixIcon: Icon(Icons.email, color: Colors.blue,),
                filled: true,
                fillColor: Color(0xFF8317d7),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4,color: Colors.white,),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                hintText: 'Enter your Email Here',
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 12,),
          MaterialButton(
            onPressed: (){},
            child: Text('𝑹𝒆𝒔𝒆𝒕 𝑷𝒂𝒔𝒔𝒘𝒐𝒓𝒅',style: TextStyle(color: Colors.white,),),
            color: Colors.deepPurple,
           )
        ],
      ),
    );
  }
}
