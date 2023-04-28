global with sharing class FutureClass {
    public static void invokeFutureMethod() {
        FutureClass.myFutureMethod();
        FutureClass.futureMethod2();
        FutureClass.futureMethod3();
    }

    @future
    public static void myFutureMethod() {
        System.debug('Inside furture method 1');
    }

    @future
    public static void futureMethod2() {
        String a;
        for (integer i = 0; i < 20000; i++ ) {
            a = i + ' : jacky';
        }
        System.debug(a);
    }
    
    @future
    public static void futureMethod3() {
        System.debug('this is belong to Method 3');
    }
}