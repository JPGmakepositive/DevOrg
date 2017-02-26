public class JSON2ApexFitbitUser {

	public class User {
		public Integer age;
		public String avatar;
		public String avatar150;
		public Integer averageDailySteps;
		public String clockTimeDisplayFormat;
		public Boolean corporate;
		public Boolean corporateAdmin;
		public String dateOfBirth;
		public String displayName;
		public String distanceUnit;
		public String encodedId;
		public Features features;
		public String foodsLocale;
		public String fullName;
		public String gender;
		public String glucoseUnit;
		public Integer height;
		public String heightUnit;
		public String locale;
		public String memberSince;
		public Integer offsetFromUTCMillis;
		public String startDayOfWeek;
		public Double strideLengthRunning;
		public String strideLengthRunningType;
		public Double strideLengthWalking;
		public String strideLengthWalkingType;
		public String timezone;
	}

	public User user;

	public class Features {
	}

	
	public static JSON2ApexFitbitUser parse(String json) {
		return (JSON2ApexFitbitUser) System.JSON.deserialize(json, JSON2ApexFitbitUser.class);
	}

}