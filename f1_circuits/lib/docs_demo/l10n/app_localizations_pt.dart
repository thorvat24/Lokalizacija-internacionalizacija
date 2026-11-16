// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get title => 'Circuitos da F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Grande Prêmio da Austrália',
      'china': 'Grande Prêmio da China',
      'japan': 'Grande Prêmio do Japão',
      'miami': 'Grande Prêmio de Miami',
      'canada': 'Grande Prêmio do Canadá',
      'monaco': 'Grande Prêmio de Mônaco',
      'barcelona': 'Grande Prêmio de Barcelona-Catalunha',
      'austria': 'Grande Prêmio da Áustria',
      'greatBritain': 'Grande Prêmio da Grã-Bretanha',
      'belgium': 'Grande Prêmio da Bélgica',
      'hungary': 'Grande Prêmio da Hungria',
      'netherlands': 'Grande Prêmio dos Países Baixos',
      'italy': 'Grande Prêmio da Itália',
      'spain': 'Grande Prêmio da Espanha',
      'azerbaijan': 'Grande Prêmio do Azerbaijão',
      'bahrain': 'Grande Prêmio do Bahrein na Malásia',
      'singapore': 'Grande Prêmio de Singapura',
      'unitedStates': 'Grande Prêmio dos Estados Unidos',
      'mexicoCity': 'Grande Prêmio da Cidade do México',
      'saoPaulo': 'Grande Prêmio de São Paulo',
      'lasVegas': 'Grande Prêmio de Las Vegas',
      'qatar': 'Grande Prêmio do Catar',
      'abuDhabi': 'Grande Prêmio de Abu Dhabi',
      'other': 'Corrida desconhecida',
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
      'other': 'Circuito desconhecido',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Corrida no circuito $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorias de ingressos',
      one: '$count categoria de ingressos',
      zero: 'Nenhuma categoria de ingressos',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Entrada geral',
      'grandstand': 'Arquibancada',
      'vip': 'VIP',
      'other': 'Outra categoria de ingressos',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Passadas',
      'upcoming': 'Próximas',
      'other': 'Todas',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count corridas',
      one: '$count corrida',
      zero: 'Nenhuma corrida',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Circuito';

  @override
  String get raceDateUtcLabel => 'Data da corrida (UTC)';

  @override
  String get raceStartUtcLabel => 'Largada (UTC)';

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
  String get displayRegionLabel => 'Região de exibição';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Região do circuito',
      'germany': 'Alemão',
      'czechia': 'Tchéquia',
      'english': 'Inglês (Reino Unido)',
      'other': 'Minha região',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Data da corrida';

  @override
  String get raceStartLabel => 'Largada';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Preços dos ingressos para o dia da corrida ($currency)';
  }

  @override
  String get sampleTicketPrices => 'Preços e taxas de câmbio de exemplo.';
}
