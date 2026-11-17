# Lokalizacija i internacionalizacija u Flutteru

## Opis projekta

U ovom sam projektu obradila lokalizaciju i internacionalizaciju na primjeru aplikacije **F1 Circuits 2026**. Aplikacija prikazuje popis utrka Formule 1 i detalje pojedine utrke. Cilj projekta je pokazati kako se tekstovi sučelja, datumi i vrijeme mogu prilagoditi jeziku i regiji korisnika.

Internacionalizacija je priprema aplikacije za više jezika i regija. U ovom projektu tekstovi su izdvojeni iz sučelja u datoteke s prijevodima. Lokalizacija je prilagodba sadržaja konkretnom jeziku ili regiji, primjerice kada se oznaka „Race start” prikaže kao „Početak utrke”.

## Tehnologije

1. **Dart** – programski jezik
2. **Flutter** – razvojni okvir za izradu korisničkog sučelja
3. **`flutter_localizations`** – prijevodi Flutterovih ugrađenih elemenata sučelja
4. **`intl`** – formatiranje datuma, vremena i brojeva
5. **Visual Studio Code** – razvojno okruženje

## Primjeri lokalizacije

1. **Tekstovi sučelja** – prijevodi su spremljeni u `.arb` datotekama. Isti ključ u različitim datotekama ima prijevod na odgovarajućem jeziku.
2. **Odabir regije prikaza** – na detaljima utrke može se usporediti prikaz za vlastitu regiju i regiju staze.
3. **Datum i vrijeme** – odabrana regija utječe na format prikaza. Vremenska zona određuje lokalno vrijeme početka utrke, koje može pasti i na drugi dan.
4. **Preračunavanje vremenske zone** – početak utrke sprema se u UTC-u i preračunava u vremensku zonu prikaza. Zbog vremenske razlike utrka koja u Las Vegasu počinje navečer u Zagrebu može biti prikazana sljedećeg jutra.
5. **Cijene ulaznica** – na detaljima utrke prikazane su tri kategorije ulaznica: opći ulaz (*General Admission*), tribina (*Grandstand*) i VIP. Iznos za svaku kategoriju prikazuje se u valuti odabrane regije. Preračunavanje određuje iznos u ciljnoj valuti, a locale određuje kako se taj iznos ispisuje, uključujući razdjelnike i položaj oznake valute.

## Podaci

Za praktične primjere koriste se podaci o utrkama sezone Formule 1 2026., poput naziva utrke, staze i vremena početka. Na detaljima iste utrke može se usporediti kako se ti podaci prikazuju pri promjeni regije.

## Literatura

- [Flutter – Internationalizing Flutter apps](https://docs.flutter.dev/ui/internationalization) – službeni vodič za konfiguraciju lokalizacije i rad s `.arb` datotekama.
- [GeeksforGeeks – Flutter Internationalization](https://www.geeksforgeeks.org/flutter/flutter-internationalization/) – dodatni primjer višejezične Flutter aplikacije.
- [Dart – paket `intl`](https://pub.dev/packages/intl) – dokumentacija za formatiranje datuma, vremena i novčanih iznosa.
- [Dart – paket `timezone`](https://pub.dev/packages/timezone) – dokumentacija za preračunavanje vremena između vremenskih zona.
- [Formula 1 – službeni kalendar za 2026.](https://www.formula1.com/en/racing/2026) – nazivi utrka i datumi održavanja.
- [Formula 1 – službene satnice utrka za 2026.](https://www.formula1.com/en/latest/article/official-grand-prix-start-times-for-2026-f1-season-confirmed.2UgPfArqH76tzlOYh21jSG.2UgPfArqH76tzlOYh21jSG) – vremena početka utrka.
