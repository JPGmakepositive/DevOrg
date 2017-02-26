public class ParkLocator {

    public static string[] country(string country){
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(country);
    }
}