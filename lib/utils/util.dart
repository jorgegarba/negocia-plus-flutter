class Utils {
  monthMes({DateTime dateTime}) {
    int day = dateTime.day ?? DateTime.now().day;
    int month = dateTime.month ?? DateTime.now().month;
    int year = dateTime.year ?? DateTime.now().year;
    switch (month) {
      case 1:
        return "Enero $day, $year";
      case 2:
        return "Febrero $day, $year";
      case 3:
        return "Marzo $day, $year";
      case 4:
        return "Abril $day, $year";
      case 5:
        return "Mayo $day, $year";
      case 6:
        return "Junio $day, $year";
      case 7:
        return "Julio $day, $year";
      case 8:
        return "Agosto $day, $year";
      case 9:
        return "Septiembre $day, $year";
      case 10:
        return "Octubre $day, $year";
      case 11:
        return "Noviembre $day, $year";
      case 12:
        return "Diciembre $day, $year";
    }
  }
}
