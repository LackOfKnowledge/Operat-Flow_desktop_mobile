class FormConstants {

  // TODO: Zastąpić w przyszłości danymi z bazy/API (np. moduł TERYT)
  static const List<String> voivodeships = [
    'dolnośląskie',
    'kujawsko-pomorskie',
    'lubelskie',
    'lubuskie',
    'łódzkie',
    'małopolskie',
    'mazowieckie',
    'opolskie',
    'podkarpackie',
    'podlaskie',
    'pomorskie',
    'śląskie',
    'świętokrzyskie',
    'warmińsko-mazurskie',
    'wielkopolskie',
    'zachodniopomorskie',
  ];

  // TODO: Zweryfikować i uzupełnić listę
  static const List<String> workTypes = [
    'Sporządzenie mapy do celów projektowych',
    'Geodezyjna inwentaryzacja powykonawcza obiektów budowlanych',
    'Wznowienie znaków granicznych, wyznaczenie punktów granicznych lub ustalenie przebiegu granic działek ewidencyjnych',
    'Sporządzenie mapy z projektem podziału nieruchomości',
    'Sporządzenie projektu scalenia i podziału nieruchomości',
    'Sporządzenie innej mapy do celów prawnych',
    'Sporządzenie projektu scalenia lub wymiany gruntów',
    'Sporządzenie dokumentacji geodezyjnej na potrzeby rozgraniczenia nieruchomości',
    'Wykonanie innych czynności lub dokumentacji geodezyjnej w postaci map, rejestrów lub wykazów, skutkujących zmianą w bazach danych, z wyjątkiem prac wykonywanych na zamówienie organu SGiK'
  ];

  static const List<String> coordinateSystems = [
    'PL-2000 strefa 5 południk 15',
    'PL-2000 strefa 6 południk 18',
    'PL-2000 strefa 7 południk 21',
    'PL-2000 strefa 8 południk 24',
    'PL-1992',
    'Inny',
  ];

  // TODO: Zweryfikować i uzupełnić listę
  static const List<String> heightSystems = [
    'PL-KRON86-NH',
    'PL-EVRF2007-NH',
    'Inny',
  ];
}