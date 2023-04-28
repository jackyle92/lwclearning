public with sharing class GoogleAPIs {
    public static void testGoogleAPIMethod() {
        GoogleAPIs.callingGoogleAPIs();
    }
    public static void callingGoogleAPIs() {
        String endPoint = 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet&part=contentDetails&part=statistics&id=UCIJDW6BLuNTl6MlvVzOUv7Q&maxResults=1&key=AIzaSyDT1-yyFkRXgNiclxjNJ8VXM9jzNfin0N0';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);
        req.setMethod('GET');
        HttpResponse res = http.send(req);

        // if request is successful 
        if (res.getStatusCode() == 200 ) {
            System.debug(res.getStatusCode());

            YoutubeAPIClass result = YoutubeAPIClass.parse(res.getBody());
            for(YoutubeAPIClass.Items item : result.items){
                System.debug('Received the following statistics: ');
                System.debug(item.snippet);
            }
        }

        if(res.getStatusCode() == 200 ) {
            // Deserialize the JSON string into collections of primitive data types
            Map<String, Object> results =(Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            system.debug('result: ' + results);

            List<Object> items = (List<Object>) results.get('items');

            for(Object item : items) {
                Map<String, Object> childItems = (Map<String, Object>) item;
                System.debug('Received the following statistics: ');
                System.debug(childItems.get('statistics'));
            }
        }
    }
}



