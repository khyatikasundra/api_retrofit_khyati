class Profiles {
  static DevelopProfiles developProfiles = DevelopProfiles();
  static ProductionProfiles productionProfiles = ProductionProfiles();
}

class DevelopProfiles {
  final String baseUrl = "https://dummyjson.com/auth";
}

class ProductionProfiles {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
}
