class NovelCovidEndpoints {
  static String covidCountry(String countryName) =>
      "https://disease.sh/v3/covid-19/countries/$countryName?strict=true";

  static String covidAllCountries() =>
      "https://disease.sh/v3/covid-19/countries";
}
