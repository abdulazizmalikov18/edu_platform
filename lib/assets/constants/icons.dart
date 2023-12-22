import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const search = 'assets/icons/search.svg';
  static const close = 'assets/icons/close.svg';
  static const eye = 'assets/icons/eye.svg';
  static const main = 'assets/icons/main.svg';
  static const play = 'assets/icons/play.svg';
  static const edu = 'assets/icons/edu.svg';
  static const messages = 'assets/icons/messages.svg';
  static const mainUnSl = 'assets/icons/main_un_sl.svg';
  static const playUnSl = 'assets/icons/play_un_sl.svg';
  static const eduUnSl = 'assets/icons/edu_un_sl.svg';
  static const messagesUnSl = 'assets/icons/messages_un_sl.svg';
  static const account = 'assets/icons/account.svg';
  static const calendar = 'assets/icons/calendar.svg';
  static const feedback = 'assets/icons/feedback.svg';
  static const help = 'assets/icons/help.svg';
  static const like = 'assets/icons/like.svg';
  static const logout = 'assets/icons/logout.svg';
  static const notif = 'assets/icons/notif.svg';
  static const subscript = 'assets/icons/subscript.svg';
  static const star = 'assets/icons/star.svg';
  static const warning = 'assets/icons/warning.svg';
  static const live = 'assets/icons/live.svg';
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
