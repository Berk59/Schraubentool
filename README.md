# Schraubentool

https://schraubentool.web.app/#/

Eine Web-App zur erst-/grobauslegung von Außensechskannt-(Pass-)schrauben.

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
- Länge des zylindrischen Einzelelements 1 (0, wenn keine Passschraube)
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

Anhand des gewählten Anziehverfahrens wird jeweils das höchste $\alpha_A$ aus der Tabelle in der Formelsammlung ausgewählt. Für das Anziehen durch Schraubenschlüssel oder Schlagsschrauber gilt $\alpha_A = 4$.

Desweiteren wird für den Krafteinleitungsfaktor $n$ der dazugehörige Wert aus der Tabelle zugewiesen.

$R_{p0,2}$ wird anhand der Formeln

$$
\begin{align}
  R_m &= 100 \cdot 1. \text{ Zahl} \\
  R_{p0,2} &= \frac{R_m}{10} \cdot 2. \text{ Zahl}
\end{align}
$$

ausgewählt.

|$\text{Festigkeitsklasse}$ | $R_{p0,2}$ |
|---------------------------|------------|
|$8.8$                      | $640.0$    |
|$10.9$                     | $900.0$    |
|$12.9$                     | $1000.0$   |

Die effektive Mutterlänge bzw. die effektive Innengewindelänge wird auf Grundlage der Verbindungsart nach der Tabelle im Abschnitt Schraubennachgiebigkeit in der Formelsammlung berechnet. Bei ausgewählter Durchschraubverbindung gilt $l_M = 0.4 \cdot d$, bei einer Einschraubverbindung $l_M = 0.33 \cdot d$.

$l_{SK} = 0.5 \cdot d$ 

$l_G = 0.5 \cdot d$

$d_2 = d - 0.64952 \cdot P$

$d_3 = d - 1.22689 \cdot P$

$d_S = 0.5 \cdot (d_2 + d_3)$

$a_N = \frac{\pi \cdot d^{2}}{4}$

$a_2 = \frac{\pi \cdot d_2^2}{4}$

$a_3 = \frac{\pi \cdot d_3^2}{4}$

### Schraubennachgiebigkeit
$\delta_S = \frac{1}{E_S} \cdot \left(\frac{l_{SK}}{a_N}+\frac{l_1}{a_N}+\frac{l_G}{a_3}+\frac{l_{UG}}{a_3}+\frac{l_M}{a_N}\right)$

### Ersatzquerschnitt 
Der Ersatzquerschnitt wird nach jeweiligem Fall aus der Tabelle in der Formelsammlung berechnet

### Plattennachgiebigkeit
$\delta_P = \frac{l_K}{E_P \cdot A_{ers}}$

### Vorspannkraft
$\Phi = n \cdot \frac{\delta_P}{\delta_P+ \delta_S}$



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
