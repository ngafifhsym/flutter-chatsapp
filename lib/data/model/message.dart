class Message{
  final String message;
  final String sender;
  final String dateTime;

  Message({required this.message, required this.sender, required this.dateTime});
}

// ** dummy message
List<Message> dummyMessage = [
  Message(message: 'Halo', sender: 'dodi', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'hai', sender: 'joko', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'knp tu?', sender: 'joko', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'ngetest', sender: 'dodi', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'Kamu sehat kan? lagi sibuk apa sekarang?', sender: 'dodi', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'Aku sehak ka fjlakjklfaalkjgkalj g jfk af jalkfgj flkgj lf gfg jf glfg f flgj glfg dlfkgjdfg fg fglfjd dfg?', sender: 'joko', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'klo kamu?', sender: 'joko', dateTime: '1969-07-20 20:18:04Z'),
  Message(message: 'Aku sehak ka fjlakjklfaalkjgkalj g jfk af jalkfgj flkgj lf gfg jf glfg f flgj glfg dlfkgjdfg fg fglfjd dfg?', sender: 'dodi', dateTime: '1969-07-20 20:18:04Z'),
];