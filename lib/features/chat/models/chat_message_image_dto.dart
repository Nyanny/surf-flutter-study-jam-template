import 'package:surf_practice_chat_flutter/features/chat/models/chat_message_dto.dart';
import 'package:surf_practice_chat_flutter/features/chat/models/chat_user_dto.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

class ChatMessageImageDto extends ChatMessageDto {
  final Uri imageUrl;

  ChatMessageImageDto(
      {required this.imageUrl,
      required ChatUserDto chatUserDto,
      required String? message,
      required DateTime createdDateTime})
      : super(
            chatUserDto: chatUserDto,
            message: message,
            createdDateTime: createdDateTime);

  ChatMessageImageDto.fromSJClient(
    this.imageUrl, {
    required SjMessageDto sjMessageDto,
    required SjUserDto sjUserDto,
  }) : super(
          createdDateTime: sjMessageDto.created,
          message: sjMessageDto.text,
          chatUserDto: ChatUserDto.fromSJClient(sjUserDto),
        );

  @override
  String toString() =>
      'ChatMessageImageDto(chatUserDto: $chatUserDto, message: $message, createdDate: $createdDateTime, image : $imageUrl)';
}
