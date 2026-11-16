// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get title => 'F1 赛道 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': '澳大利亚大奖赛',
      'china': '中国大奖赛',
      'japan': '日本大奖赛',
      'miami': '迈阿密大奖赛',
      'canada': '加拿大大奖赛',
      'monaco': '摩纳哥大奖赛',
      'barcelona': '巴塞罗那-加泰罗尼亚大奖赛',
      'austria': '奥地利大奖赛',
      'greatBritain': '英国大奖赛',
      'belgium': '比利时大奖赛',
      'hungary': '匈牙利大奖赛',
      'netherlands': '荷兰大奖赛',
      'italy': '意大利大奖赛',
      'spain': '西班牙大奖赛',
      'azerbaijan': '阿塞拜疆大奖赛',
      'bahrain': '巴林（马来西亚站）大奖赛',
      'singapore': '新加坡大奖赛',
      'unitedStates': '美国大奖赛',
      'mexicoCity': '墨西哥城大奖赛',
      'saoPaulo': '圣保罗大奖赛',
      'lasVegas': '拉斯维加斯大奖赛',
      'qatar': '卡塔尔大奖赛',
      'abuDhabi': '阿布扎比大奖赛',
      'other': '未知比赛',
    });
    return '$_temp0';
  }

  @override
  String circuitName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Albert Park Grand Prix Circuit',
      'china': 'Shanghai International Circuit',
      'japan': 'Suzuka International Racing Course',
      'miami': 'Miami International Autodrome',
      'canada': 'Circuit Gilles-Villeneuve',
      'monaco': 'Circuit de Monaco',
      'barcelona': 'Circuit de Barcelona-Catalunya',
      'austria': 'Red Bull Ring',
      'greatBritain': 'Silverstone Circuit',
      'belgium': 'Circuit de Spa-Francorchamps',
      'hungary': 'Hungaroring',
      'netherlands': 'Circuit Zandvoort',
      'italy': 'Autodromo Nazionale Monza',
      'spain': 'Madring',
      'azerbaijan': 'Baku City Circuit',
      'bahrain': 'Sepang International Circuit',
      'singapore': 'Marina Bay Street Circuit',
      'unitedStates': 'Circuit of the Americas',
      'mexicoCity': 'Autódromo Hermanos Rodríguez',
      'saoPaulo': 'Autódromo José Carlos Pace (Interlagos)',
      'lasVegas': 'Las Vegas Strip Circuit',
      'qatar': 'Lusail International Circuit',
      'abuDhabi': 'Yas Marina Circuit',
      'other': '未知赛道',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return '在$circuitName举行的比赛';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count种门票',
      zero: '没有门票类别',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': '普通入场',
      'grandstand': '看台座位',
      'vip': '贵宾票',
      'other': '其他门票类别',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': '已开始',
      'upcoming': '即将举行',
      'other': '全部',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count场比赛',
      zero: '没有比赛',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => '赛道';

  @override
  String get raceDateUtcLabel => '正赛日期 (UTC)';

  @override
  String get raceStartUtcLabel => '正赛开始时间 (UTC)';

  @override
  String raceDateValue(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String raceTimeValue(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.jm(localeName);
    final String timeString = timeDateFormat.format(time);

    return '$timeString';
  }

  @override
  String get displayRegionLabel => '显示地区';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': '赛道所在地区',
      'germany': '德语',
      'czechia': '捷克',
      'english': '英语（英国）',
      'other': '我的地区',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => '正赛日期';

  @override
  String get raceStartLabel => '正赛开始时间';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }
}
