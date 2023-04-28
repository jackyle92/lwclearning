public with sharing class ApexTest {
    public ApexTest() {

    }

    public static void testing() {
        LearningSFDevAPI.Message newMes = new LearningSFDevAPI.Message();
        newMes.id = '100';
        newMes.body = 'Elit ipsum excepteur proident laboris qui proident reprehenderit do Lorem. Magna in commodo laboris laborum laborum do incididunt Lorem.';
        newMes.location = '14/27 Than Van Nhiep, Hue City';
        newMes.sender = 'Jacky Lee';
        newMes.posted = Date.today();
        newMes.email = 'jacky.lee@crosscloudpartners.com';
        newMes.test = false;

        LearningSFDevAPI.sendMessage(newMes);

        List<LearningSFDevAPI.Message> lst = LearningSFDevAPI.getMessage();
        System.debug(lst[0]);
    }
}