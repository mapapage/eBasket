package foo;

public class calcQuantity {
    
    private int qcafe;
    private int qsugar;
    private int qwater;
    
    public calcQuantity() {
        this.qcafe = 0;
        this.qsugar = 0;
        this.qwater = 0;
    }
    
    public String getqcafe() {
        return Integer.toString(this.qcafe);
    }
    
    public void setqcafe(String s) {
        
            this.qcafe = Integer.parseInt(s);
       
        
    }
    
    public String getqsugar() {
        return Integer.toString(this.qsugar);
    }
    
    public void setqsugar(String s) {
        
            this.qsugar = Integer.parseInt(s);
        
    }
    
    public String getqwater() {
        return Integer.toString(this.qwater);
    }
    
    public void setqwater(String s) {
       
            this.qwater = Integer.parseInt(s);
        
       
    }
    
}