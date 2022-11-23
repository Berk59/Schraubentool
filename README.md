# Schraubentool

Eine Flutter-Website zur erst-/grobauslegung von Schrauben

## Anleitung

Die Berechnung basiert auf dem Kapitel Schraubverbindungen aus der KE-Formelsammlung.

### Eingabe

In der linken Spalte wählt man im obersten Dropdown, ob es sich um eine Einschraub- (ESV) oder Durchschraubverbindung handelt.
Die weiteren Eingabefelder beinhalten:
- Betriebskraft
- Klemmlänge
- E-Modul der Schraube (aus Norm)
- E-Modul der Platte (nach Werkstoff)
- Nenndurchmesser der Schraube (bsp. MJ**14**)
- Gewindesteigung
- ???
- Ungenutzte Außengewindelänge
- Durchmesser der Kopfauflage
- Außendurchmesser der Platten (2 * kleinster Randabstand)
- Durchmesser des Durchgangslochs
- Setzbetrag

Auf der rechten Spalte können dann noch Anziehverfahren, der Fall für den Krafteinleitungsfaktor *n* und die Festigkeitsklasse ausgewählt werden.

Durch das Drücken des "Berechnen!" Buttons wird die Berechnung durchgeführt.

### Ausgabe

Unter der Eingabe werden in einzelnen Segmenten einige Zwischenergebnisse angezeigt, die zur Dokumentation der Berechnung verwendet werden können. Ganz unten findet man dann die Mindest- und Maximalspannung inklusive der dazugehörigen Sicherheit.

## Berechnung

Muss ergänzt werden

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
