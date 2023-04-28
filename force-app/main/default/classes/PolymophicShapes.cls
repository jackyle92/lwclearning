public with sharing class PolymophicShapes {
    public PolymophicShapes() {

    }
    public static void printArea(AbstractShape s) {
        System.debug('The area of our shape is: ' + s.getArea());
    }

    public static void setColor(AbstractShape s, Integer r, Integer b, Integer g) {
        System.debug(s);
        s.red = r;
        s.blue = b;
        s.green = g;
        System.debug(s);
    }

    public static void makeBlack(AbstractShape s){
        System.debug(s);
        s.setToBlack();
        System.debug(s);
    }
}