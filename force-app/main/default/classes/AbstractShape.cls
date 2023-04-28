public abstract class AbstractShape {
    public Integer red;
    public Integer blue;
    public Integer green;

    public abstract Double getArea();
    //default implementation but can be overrided if needed
    public virtual Integer getNumberOfSides() {
        return 4;
    }

    public void setToBlack() {
        this.red = 0;
        this.blue = 0;
        this.green = 0;
    }
}