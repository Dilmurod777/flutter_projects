import 'package:chat_contacts_list/modals/message.dart';
import 'package:chat_contacts_list/modals/user.dart';

final User myProfile = User(
  id: 1000,
  firstName: '',
  lastName: '',
  imgUrl: 'https://randomuser.me/api/portraits/men/33.jpg',
  lastActivityTime: DateTime.now(),
  likes: 12,
  history: [],
);


final contacts = [
  User(
    id: 1,
    firstName: 'Владислав',
    lastName: '',
    imgUrl: 'https://randomuser.me/api/portraits/men/44.jpg',
    lastActivityTime: DateTime.now().subtract(Duration(minutes: 2)),
    history: [
      Message(
        text: 'Привет',
        authorId: 1,
        time: DateTime.now(),
        isRead: true,
      ),
      Message(
        text: 'Как дела?',
        authorId: 1,
        time: DateTime.now(),
        isRead: true,
      ),
    ],
  ),
  User(
    id: 2,
    firstName: 'Екатерина',
    lastName: '',
    imgUrl: 'https://randomuser.me/api/portraits/women/63.jpg',
    lastActivityTime: DateTime.now(),
    history: [
      Message(
        text: 'Привет',
        authorId: 2,
        time: DateTime.now(),
      ),
      Message(
        text: 'Предлагаю встретиться и обсудить нашу встречу',
        authorId: 2,
        time: DateTime.now(),
      ),
    ],
  ),
  User(
    id: 3,
    firstName: 'Настя',
    lastName: '',
    imgUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    lastActivityTime: DateTime.now().subtract(Duration(minutes: 10)),
    isPinned: true,
    history: [
      Message(
        text: 'Привет',
        authorId: 3,
        time: DateTime.now(),
        isRead: true,
      ),
      Message(
        text: 'Как дела?',
        authorId: 3,
        time: DateTime.now(),
        isRead: true,
      ),
    ],
  ),
  User(
    id: 4,
    firstName: 'Максим',
    lastName: '',
    imgUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
    lastActivityTime: DateTime.now().subtract(Duration(minutes: 25)),
    isPinned: true,
    history: [
      Message(
        text: 'Привет',
        authorId: 4,
        time: DateTime(2020, 1, 1, 12, 30),
      ),
      Message(
        text: 'Как дела?',
        authorId: 4,
        time: DateTime(2020, 1, 1, 12, 30),
      ),
      Message(
        text: 'Давай встретимся?',
        authorId: 4,
        time: DateTime(2020, 1, 1, 12, 30),
      ),
    ],
  ),
  User(
    id: 5,
    firstName: 'Артем',
    lastName: '',
    imgUrl: 'https://randomuser.me/api/portraits/men/61.jpg',
    lastActivityTime: DateTime.now(),
    history: [
      Message(
        text: 'Привет',
        authorId: 5,
        time: DateTime.now(),
        isRead: true,
      ),
      Message(
        text: 'Как дела?',
        authorId: 5,
        time: DateTime.now(),
        isRead: true,
      ),
    ],
  ),
];
