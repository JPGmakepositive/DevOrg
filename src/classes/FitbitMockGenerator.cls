global class FitbitMockGenerator  implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"activities":[],"goals":{"activeMinutes":30,"caloriesOut":2442,"distance":8.05,"floors":10,"steps":10000},"summary":{"activeScore":-1,"activityCalories":0,"caloriesBMR":573,"caloriesOut":573,"distances":[{"activity":"total","distance":0},{"activity":"tracker","distance":0},{"activity":"loggedActivities","distance":0},{"activity":"veryActive","distance":0},{"activity":"moderatelyActive","distance":0},{"activity":"lightlyActive","distance":0},{"activity":"sedentaryActive","distance":0}],"elevation":0,"fairlyActiveMinutes":0,"floors":0,"lightlyActiveMinutes":0,"marginalCalories":0,"sedentaryMinutes":576,"steps":0,"veryActiveMinutes":0}}');
        res.setStatusCode(200);
        return res;

    }
}