import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/ticket_pricing.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:material_ui/material_ui.dart';

class TicketPricesCard extends StatelessWidget {
  const TicketPricesCard({
    super.key,
    required this.prices,
    required this.currency,
    required this.locale,
  });

  final TicketPrices prices;
  final TicketCurrency currency;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final format = NumberFormat.simpleCurrency(
      locale: locale,
      name: currency.code,
    );

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messages.raceDayTicketPrices(currency.code),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  messages.sampleTicketPrices,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          for (final category in TicketCategory.values) ...[
            const Divider(indent: 16, endIndent: 16),
            ListTile(
              title: Text(messages.ticketCategory(category.name)),
              trailing: Text(
                format.format(
                  prices.eurosFor(category) * currency.unitsPerEuro,
                ),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w800,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ),
          ],
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
