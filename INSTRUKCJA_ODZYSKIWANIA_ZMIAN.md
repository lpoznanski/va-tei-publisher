# JAK ODZYSKAĆ UTRACONE ZMIANY W TEI PUBLISHER
Instrukcja postępowania w przypadku utraty zmian wprowadzonych w aplikacji tei-publisher na potrzeby projektu Vaticana

 Wszystkie zmiany wprowadzone w aplikacji znajdują się na oddzielnej gałęzi *lp/vaticana-version* w zdalnym repozytorium na GitHub [va-tei-publisher](https://github.com/lpoznanski/va-tei-publisher/).

## Krok po kroku
### 1. Instalacja Tuttle
Nalezy upewnić się, czy na serwerze eXist-db jest zainstalowana aplikacja *Tuttle - Git for eXist-db*.
Jeśli nie, nalezy ją zainstalować przy pomocy Package Manager
### 2. Konfiguracja Tuttle
W Tuttle nalezy zedytować plik konfiguracyjny *config.xql* dla tei-publisher zgodnie z [dokumentacją tuttle](https://eeditiones.github.io/tuttle-doc/getstarted/). Dla klucza *ref* nalezy podac nazwę odpowiedniej gałęzi.
(Przykładowy uzupełniony plik konfiguracyjny znajduje się w tym repozytorium w katalogu *tuttle_config*.)
### 3. Przesłanie zmian do eXist-db
Następnie nalezy wejsc do aplikacji Tuttle. Jeśli wszystko jest prawidłowo skonfigurowane, po otwarciu aplikacji na ekranie głównym pokaze się nazwa repozytorium. Mozna teraz przesłać dane z gita do eXist-db.
