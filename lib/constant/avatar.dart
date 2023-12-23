import 'package:flutter/widgets.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: ClipOval(
        // child: Image.asset("assets/no_avatar.jpeg", fit: BoxFit.contain),
        child: Image.asset("assets/avatartest.png", fit: BoxFit.contain),
      ),
    );
  }
}
