# Schraubentool


Eine Web-App zur erst-/grobauslegung von (Pass-)Schrauben.

https://schraubentool.web.app/#/


## Anleitung

Die Berechnung basiert auf dem Kapitel Schraubverbindungen aus der KE-Formelsammlung. Alle benutzten Formeln sind ebenda auch zu finden.

### Eingabe

In der linken Spalte wählt man im obersten Dropdown, ob es sich um eine Einschraub- (ESV) oder Durchschraubverbindung handelt.
Die weiteren Eingabefelder beinhalten:
- $F_A$ (Betriebskraft)
- $l_k$ (Klemmlänge)
- $E_S$ (E-Modul der Schraube (aus Norm))
- $E_P$ (E-Modul der Platte (nach Werkstoff))
- $d$ (Nenndurchmesser der Schraube (bsp. MJ**14**))
- $P$ (Gewindesteigung)
- $l_1$ (Länge des zylindrischen Einzelelements 1 (0, wenn keine Passschraube))
- $l_{UG}$ (Ungenutzte Außengewindelänge)
- $d_W$ (Durchmesser der Kopfauflage)
- $D_A$ (Außendurchmesser der Platten (2 * kleinster Randabstand))
- $d_h$ (Durchmesser des Durchgangslochs)
- $f_Z$ (Setzbetrag)

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

$a_2 = \frac{\pi \cdot d_2^2}{4}$

### Schraubennachgiebigkeit
$d_3 = d - 1.22689 \cdot P$,

$A_N = \frac{\pi \cdot d^{2}}{4}$, 

$A_3 = \frac{\pi \cdot d_3^2}{4}$, 

$l_{SK} = 0.5 \cdot d$,

$l_G = 0.5 \cdot d$

$$\delta_S = \frac{1}{E_S} \cdot \left(\frac{l_{SK}}{a_N}+\frac{l_1}{a_N}+\frac{l_G}{a_3}+\frac{l_{UG}}{a_3}+\frac{l_M}{a_N}\right)$$

### Ersatzquerschnitt 
Der Ersatzquerschnitt wird nach jeweiligem Fall aus der Tabelle in der Formelsammlung berechnet

### Plattennachgiebigkeit
$$\delta_P = \frac{l_K}{E_P \cdot A_{ers}}$$

### Vorspannkraft
$\Phi = n \cdot \frac{\delta_P}{\delta_P+ \delta_S}$
<<<<<<< HEAD

$F_Z = \frac{f_Z}{\delta_S+\delta_P}$

$$F_{V,min} = F_{Kl,erf}+F_Z+(1-\Phi) \cdot F_A$$
$$F_{V,max} = \alpha_A \cdot F_{V,min}$$

### Spannungsquerschnitt
$d_2 = d - 0.64952 \cdot P$,

$d_S = 0.5 \cdot (d_2 + d_3)$

$$A_S = \frac{\pi \cdot d_S^2}{4}$$

### Zugkraft an der Schraube
$F_{AS} = 0.1 \cdot R_{p0,2} \cdot A_S$

$$F_{S,min} = F_{V,min} + F_{AS}$$

$$F_{S,max} = F_{V,max} + F_{AS}$$

### Spannung
$$\sigma_{min} = \frac{F_{S,min}}{A_S} \rightarrow \mu_{min} := \frac{\sigma_{zul}}{\sigma_{min} \cdot 1.5} $$

$$\sigma_{max} = \frac{F_{S,max}}{A_S} \rightarrow \mu_{max} := \frac{\sigma_{zul}}{\sigma_{max} \cdot 1.5} $$
