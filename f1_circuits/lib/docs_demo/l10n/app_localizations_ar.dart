// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get title => 'حلبات فورمولا 1 لعام 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'جائزة أستراليا الكبرى',
      'china': 'جائزة الصين الكبرى',
      'japan': 'جائزة اليابان الكبرى',
      'miami': 'جائزة ميامي الكبرى',
      'canada': 'جائزة كندا الكبرى',
      'monaco': 'جائزة موناكو الكبرى',
      'barcelona': 'جائزة برشلونة-كاتالونيا الكبرى',
      'austria': 'جائزة النمسا الكبرى',
      'greatBritain': 'جائزة بريطانيا الكبرى',
      'belgium': 'جائزة بلجيكا الكبرى',
      'hungary': 'جائزة المجر الكبرى',
      'netherlands': 'جائزة هولندا الكبرى',
      'italy': 'جائزة إيطاليا الكبرى',
      'spain': 'جائزة إسبانيا الكبرى',
      'azerbaijan': 'جائزة أذربيجان الكبرى',
      'bahrain': 'جائزة البحرين الكبرى في ماليزيا',
      'singapore': 'جائزة سنغافورة الكبرى',
      'unitedStates': 'جائزة الولايات المتحدة الكبرى',
      'mexicoCity': 'جائزة مدينة مكسيكو الكبرى',
      'saoPaulo': 'جائزة ساو باولو الكبرى',
      'lasVegas': 'جائزة لاس فيغاس الكبرى',
      'qatar': 'جائزة قطر الكبرى',
      'abuDhabi': 'جائزة أبوظبي الكبرى',
      'other': 'سباق غير معروف',
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
      'other': 'حلبة غير معروفة',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'السباق على حلبة $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فئة تذاكر',
      many: '$count فئة تذاكر',
      few: '$count فئات تذاكر',
      two: 'فئتا تذاكر',
      one: 'فئة تذاكر واحدة',
      zero: 'لا توجد فئات تذاكر',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'دخول عام',
      'grandstand': 'مقاعد المدرجات',
      'vip': 'كبار الشخصيات',
      'other': 'فئة تذاكر أخرى',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'السابقة',
      'upcoming': 'القادمة',
      'other': 'الكل',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سباق',
      many: '$count سباقًا',
      few: '$count سباقات',
      two: 'سباقان',
      one: 'سباق واحد',
      zero: 'لا توجد سباقات',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'الحلبة';

  @override
  String get raceDateUtcLabel => 'تاريخ السباق (UTC)';

  @override
  String get raceStartUtcLabel => 'موعد انطلاق السباق (UTC)';

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
  String get displayRegionLabel => 'منطقة العرض';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'منطقة الحلبة',
      'germany': 'الألمانية',
      'czechia': 'التشيك',
      'english': 'الإنجليزية (المملكة المتحدة)',
      'other': 'منطقتي',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'تاريخ السباق';

  @override
  String get raceStartLabel => 'موعد انطلاق السباق';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'أسعار تذاكر يوم السباق ($currency)';
  }

  @override
  String get sampleTicketPrices => 'أسعار وأسعار صرف لأغراض العرض.';

  @override
  String get demoEscapedZone => 'المنطقة الزمنية: {UTC}';

  @override
  String demoShortDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String demoFormatUsd(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.simpleCurrency(locale: localeName, name: 'USD');
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }

  @override
  String demoCompactHuf(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.compactCurrency(
          locale: localeName,
          name: 'HUF',
          decimalDigits: 1,
        );
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }
}
