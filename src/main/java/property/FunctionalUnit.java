package property;

public abstract class FunctionalUnit {

    private String name;
    private String address;
    private Contract contract;

    public FunctionalUnit(String name, String address) {
        this.name = name;
        this.address = address;
        contract = null;
    }
}
