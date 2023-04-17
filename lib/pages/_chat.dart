import 'package:flames_ui/theme/color.dart';
import 'package:flames_ui/util/bottom_navigation_bar_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/chat_json.dart';
import '../util/story_json.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SafeArea(
       child:  Scaffold(
         backgroundColor: bg,
         body: Column ( children:  [
             Padding(
               padding: const EdgeInsets.fromLTRB(20,30,20,10),
               child: Row(  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                 children:  [
                      Image.asset("assets/images/id.png"),
                      Row(
                        children: const [
                          Text("Find Flames", style: TextStyle(color: primary,fontSize: 26), ),
                       SizedBox(width: 20,) ],
                      ),
                      // const SizedBox(width: 0.01,),
                       SvgPicture.asset("assets/images/setting4.svg"),
                 ],
               ),
             ),
           SingleChildScrollView(
             scrollDirection:  Axis.horizontal,
             padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
             child: Row(
                 children: List.generate(stories.length, (index) {
                   return Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Container( //color: Colors.amber,

                       child: Column(
                         children: [
                           Stack(     clipBehavior:  Clip.none,
                             alignment: Alignment.center,
                             children: [
                               stories[index]['isStory']
                                   ? Container(
                                 decoration:  const BoxDecoration(


                                   //  gradient: LinearGradient(colors: bgStoryColors),

                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(0.0),
                                   child: Container(
                                     height: 120,
                                     width: 100,
                                     decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                         image: DecorationImage(
                                             image: NetworkImage(stories[index]['imageUrl']),
                                             fit: BoxFit.cover
                                         )
                                     ),
                                   ),
                                 ),
                               )
                                   : Padding(
                                 padding: const EdgeInsets.all(1.0),
                                 child: Container(
                                   height: 120,
                                   width: 100,
                                   padding:  const EdgeInsets.fromLTRB(8,20,8,20),
                                   decoration: BoxDecoration(
                                     //  shape: BoxShape.circle,
                                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                                       image: DecorationImage(
                                           image: NetworkImage(stories[index]['imageUrl']),
                                           fit: BoxFit.cover
                                       ),
                                   ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children:  [
                                        SvgPicture.asset("assets/images/heart.svg"),
                                        const Text("20",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                     ],
                                   ),
                                 ),
                               ),
                               stories[index]['isAdd']
                                   ? Positioned(

                                 bottom: -8,
                                 child: Container(

                                   padding: EdgeInsets.fromLTRB(8,1,8,1),
                                   decoration: const BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(5)),
                                      // shape: BoxShape.circle,
                                       color: Colors.white
                                   ),
                                   child:  Center(
                                     child: Text("${stories[index]['username']}",style: TextStyle(color: textGrey,fontWeight: FontWeight.w400),),
                                   ),
                                 ),
                               )
                                   : Positioned(

                                 bottom: -9,
                                 child: Container( 
                                   // height: 17,
                                   // width: 65,
                                   decoration: const BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(5)),
                                       // shape: BoxShape.circle,
                                       color: Colors.white
                                   ),
                                   padding: EdgeInsets.fromLTRB(5,2,5,2),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children:  [
                                       Text("${stories[index]['username']}",style: TextStyle(color: textGrey,fontWeight: FontWeight.w400),),
                                       SizedBox(width: 2,),
                                       SvgPicture.asset("assets/images/verify.svg",height: 15),
                                     ],
                                   ),
                                 ),
                               )
                             ],
                           ),
                           SizedBox(height: 5),

                         ],
                       ),
                     ),
                   );
                 })
             ),
           ),

         ],),
         bottomSheet: Stack( clipBehavior:  Clip.none,
               alignment: Alignment.center,
           children :[
             Container(
               height: size.height*0.52,
               width: size.width,

             decoration:const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(20.0),
                 topRight: Radius.circular(20.0),
               ),
             ),
              child:  ListView( padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                children: List.generate(chats.length, (index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,0,0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: (size.width - 20) * 0.15,
                                width: (size.width - 20) * 0.15,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(chats[index]['profile']),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container( //color: Colors.black26,
                                width: (size.width - 10) * 0.67,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            chats[index]['username'],
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color:chats[index]['chats']=="0"? textLight:textGrey  ),
                                          ),
                                          const SizedBox(width: 5,),
                                          chats[index]['verified'] == "true"?
                                           SvgPicture.asset("assets/images/verify.svg"): Container(),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      chats[index]['typing']== "false"?
                                      Text(
                                        "${chats[index]['description']} ",
                                        style: TextStyle(fontSize: 16, height: 1, color: chats[index]['chats']=="0"? textLight:textGrey),
                                      ): Text(
                                        "${chats[index]['description']} ",
                                        style: const TextStyle(fontSize: 16, height: 1, color: primary,fontStyle:  FontStyle.italic , fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [   Text(
                                  "${chats[index]['dateTime']} ",
                                  style: TextStyle(fontSize: 13, height: 1, color: chats[index]['chats']=="0"? textLight:textGrey),
                                ),
                               const SizedBox(height: 3,),
                               chats[index]['chats']!="0"?
                                  Container( //color: Colors.amber,
                                    width: (size.width-80 ) * 0.055,
                                    height: (size.width-80 ) * 0.05,
                                    alignment: Alignment.center,
                                    decoration:  const BoxDecoration(
                                        shape: BoxShape.circle,

                                      color: primary,
                                    ),
                                    child: Text(chats[index]['chats'],
                                      style: const TextStyle(fontSize: 10, height: 1, color: textWhite),
                                    ),
                                  ) : Container(),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Divider( ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
           ),
             Positioned(
               top: -30,
               child: Container(
                 width: (size.width)*0.85,
                 decoration:  BoxDecoration(
                   boxShadow: [ BoxShadow(
                     color: Colors.grey[400],
                     blurRadius: 5.0,
                   ),],
                   borderRadius:BorderRadius.all(Radius.circular(20)) ,
                   color:(Colors.white),
                 ),

                 child: Padding(padding: const EdgeInsets.only(left: 10 ,right:10 ,bottom: 1,top: 1),

                   child: Row(

                     mainAxisAlignment: MainAxisAlignment.start,
                     children:  <Widget>[ IconButton( onPressed: (){},
                       icon: SvgPicture.asset(
                        "assets/images/searchnormal1.svg"

                       ), ),
                       SizedBox(width: 20), // give it width
             const           Text("Search",
                           style: TextStyle(color: Color(0xff888888), fontSize: 22, fontWeight: FontWeight.w300)   ),
                     ],
                   ),
                 ),

               ),
             ),
           ],
         ),

       ),
    );
  }
}
