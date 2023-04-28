public with sharing class Book {
    public String title;
    public List<Chapter> chapters = new List<Chapter>();

    public with sharing class Chapter{
        String chapterTitle;
        public Integer numberOfPage;
        public Chapter() {
            this.chapterTitle = 'Apex Class';
            this.numberOfPage = 25;
            System.debug(this.chapterTitle + this.numberOfPage);
        }
    }

}