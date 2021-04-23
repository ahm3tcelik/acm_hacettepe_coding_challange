import 'message_model.dart';
import 'chat_model.dart';
import 'user_model.dart';

final users = <User>[
  User(
      userId: '1',
      userName: 'Alex',
      userSurname: 'George',
      isOnline: true,
      avatarUrl: 'https://i.pravatar.cc/150?img=7'),
  User(
      userId: '2',
      userName: 'Darelli',
      userSurname: 'Dalton',
      isOnline: false,
      avatarUrl: 'https://i.pravatar.cc/150?img=1'),
  User(
      userId: '3',
      userName: 'Murphy',
      userSurname: 'Star',
      isOnline: false,
      avatarUrl: 'https://i.pravatar.cc/150?img=2'),
  User(
      userId: '4',
      userName: 'Devon',
      userSurname: 'Smith',
      isOnline: false,
      avatarUrl: 'https://i.pravatar.cc/150?img=3'),
  User(
      userId: '5',
      userName: 'Floyd',
      userSurname: 'Edgar',
      isOnline: true,
      avatarUrl: 'https://i.pravatar.cc/150?img=4'),
  User(
      userId: '6',
      userName: 'Raphael',
      userSurname: 'Sunday',
      isOnline: false,
      avatarUrl: 'https://i.pravatar.cc/150?img=5'),
  User(
      userId: '7',
      userName: 'Elvan',
      userSurname: 'Dalton',
      isOnline: false,
      avatarUrl: 'https://i.pravatar.cc/150?img=6'),
];

final chatList = <Chat>[
  Chat.createWithId(
    user1: users[0],
    user2: users[1],
    messages: [
      Message(
          messageId: 1,
          messageContent: 'Hi, tomorrow I go to school with me not?',
          senderId: users[1].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
    ],
  ),
  Chat.createWithId(
    user1: users[0],
    user2: users[4],
    messages: [
      Message(
          messageId: 2,
          messageContent: 'Hello, Esther',
          senderId: users[4].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
      Message(
          messageId: 3,
          messageContent: 'What are you doing?',
          senderId: users[4].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
      Message(
          messageId: 4,
          messageContent: 'Are you busy?',
          senderId: users[0].userId,
          receiverId: users[4].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
      Message(
          messageId: 5,
          messageContent: 'Yes?',
          senderId: users[4].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
      Message(
          messageId: 6,
          messageContent: 'Noxsxsx?',
          senderId: users[4].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
    ],
  ),
  Chat.createWithId(
    user1: users[0],
    user2: users[2],
    messages: [
      Message(
          messageId: 1,
          messageContent: 'Hi, tomorrow I go to library with me?',
          senderId: users[2].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.utc(2021, 4,  23, 10, 20).toString()),
    ],
  ),
  Chat.createWithId(
    user1: users[0],
    user2: users[3],
    messages: [
      Message(
          messageId: 1,
          messageContent: 'Hello, I am tired',
          senderId: users[3].userId,
          receiverId: users[0].userId,
          receiveTime: null,
          sendTime: DateTime.now().toString()),
    ],
  ),
];
