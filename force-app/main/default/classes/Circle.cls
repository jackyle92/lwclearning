public with sharing class Circle extends AbstractShape {
    private Double radius;
    public Circle(Double radius) {
        this.radius = radius;
    }

    public override Integer getNumberOfSides() {
        return 1;
    }
    
    public override Double getArea(){
        return 2 * Math.PI * this.radius;
    }
}