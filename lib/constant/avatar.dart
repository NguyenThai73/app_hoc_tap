import 'package:cached_network_image/cached_network_image.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Avatar extends StatefulWidget {
  final double? height;
  const Avatar({super.key, this.height});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String? avaterUser;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var avatar = prefs.getString("avatar");
    setState(() {
      avaterUser = avatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.height ?? 60,
      height: widget.height ?? 60,
      child: ClipOval(
        child: (avaterUser != null &&  avaterUser !="")
            ? CachedNetworkImage(
               imageUrl: "$baseUrl/api/files/${avaterUser!}",
                fit: BoxFit.cover,
              )
            : Image.asset("assets/no_avatar.jpeg", fit: BoxFit.cover),
      ),
    );
  }
}
