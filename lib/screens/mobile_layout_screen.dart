import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/group/screens/create_group_screen.dart';
import 'package:whatsapp_ui/features/intelligent_assistance/home_page.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:whatsapp_ui/features/chat/widgets/contacts_list.dart';
import 'package:whatsapp_ui/features/status/screens/confirm_status_screen.dart';
import 'package:whatsapp_ui/features/status/screens/status_contacts_screen.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
      late TabController tabBarController;
  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
        elevation: 0,
        backgroundColor: Colors.transparent, // Set the background color to transparent
        centerTitle: false,
        flexibleSpace: Container(
          decoration:const BoxDecoration(
             borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.indigo,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
          title: const Text(
            'CHATIFY',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.voice_chat, color: Colors.grey),
            //   onPressed: () {
            //     Navigator.pushNamed(context, HomePage.routeName);
            //   },
            // ),
            IconButton(
  icon: Image.asset(
    'assets/images/virtualAssistant.png',
    // color: Colors.grey,
    width: 24, // adjust the width to fit your needs
    height: 24, // adjust the height to fit your needs
  ),
  onPressed: () {
    Navigator.pushNamed(context, HomePage.routeName);
  },
),
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text(
                    'Create Group',
                  ),
                  
                  onTap: () => Future(
                    () => Navigator.pushNamed(
                        context, CreateGroupScreen.routeName),
                  ),
                )
              ],
            ),
          ],
          bottom:  TabBar(
            controller: tabBarController,
            indicatorColor: tabColor2,
            indicatorWeight: 4,
            labelColor: tabColor2,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              // Tab(
              //   text: 'CALLS',
              // ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabBarController,
          children: const [
          ContactsList(),
          StatusContactsScreen(),
          // Text('Calls'),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if(tabBarController.index == 0){

            Navigator.pushNamed(context, SelectContactsScreen.routeName);
            }else{
              File? pickedImage = await pickImageFromGallery(context);
              if(pickedImage!=null){
                Navigator.pushNamed(context, ConfirmStatusScreen.routeName, arguments: pickedImage);
              }
            }
          },
          backgroundColor: tabColor,
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
