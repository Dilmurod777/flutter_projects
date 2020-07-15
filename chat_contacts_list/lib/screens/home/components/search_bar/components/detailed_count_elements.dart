import 'package:chat_contacts_list/components/search_input.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class DetailedCountElements extends StatelessWidget {
  final List<User> contacts;
  final Function showOnlineChat;
  final Function showPinnedChat;

  const DetailedCountElements({
    Key key,
    this.contacts,
    this.showOnlineChat,
    this.showPinnedChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SearchInput(
        icon: Icons.wifi_tethering,
        text: 'Только онлайн',
        count: contacts.where((contact) => contact.isOnline).length,
        addRightMargin: false,
        disabled: true,
        onTap: showOnlineChat,
      ),
      SearchInput(
        icon: Icons.bookmark_border,
        text: 'Избранные',
        count: contacts.where((contact) => contact.isPinned).length,
        addRightMargin: false,
        disabled: true,
        onTap: showPinnedChat,
      )
    ]);
  }
}
