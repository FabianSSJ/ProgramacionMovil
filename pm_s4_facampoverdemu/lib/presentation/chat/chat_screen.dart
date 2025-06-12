import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cristiano Ronaldo'),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fuio13-1.fna.fbcdn.net/v/t39.30808-6/448474001_1102716254548247_2613997786866384047_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEkHzbjgvwXJc_oubG6RG8kWz1HHlakEhFbPUceVqQSEdPEbnSgXFLByHj88_om4IyhmZqRKTWLDq-QNaS3bN8w&_nc_ohc=hn8Lv3ttAtUQ7kNvwFRkWph&_nc_oc=AdlCly5GJknUVoZ-SxouT4UXgyIqG8zDV6H5-b0yUaHmtEitA-xHoKvXgO2wBG1umCA&_nc_zt=23&_nc_ht=scontent.fuio13-1.fna&_nc_gid=Y2J8pSyy82sQJ1YNs1Ct7Q&oh=00_AfOYHO_WWARBjUgb2Vb_AJKLQUq3QlEuKwUNPGfoZWPMyA&oe=684FEEE3'),
          ),
          ),
          //centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text("Cp1"),
        //Text("Cp2"),
        //Expanded(child: Container(color: Colors.amberAccent,)),
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return Text ("los chats $index");
        },
        itemCount: 10,
        )
        ),
        Text("Caja de texto"),
        ],
        );
        }
        }