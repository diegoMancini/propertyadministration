package propertyAdmin.web.property.structure.specifics;

import propertyAdmin.web.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class LivingPlace extends FunctionalUnit {

    @Column(name = "BEDROOMS_AMOUNT")
    private Integer bedroomsAmount;
    @Column(name = "KITCHEN_TYPE")
    private String kitchenType;
    @Column(name = "HAS_GRILL")
    private boolean hasGrill;
    @Column(name = "HAS_YARD")
    private boolean hasYard;
    @Column(name = "HAS_BALCONY")
    private boolean hasBalcony;
    @Column(name = "HAS_GARAGE")
    private boolean hasGarage;


    public LivingPlace() {
    }

    public LivingPlace(String name, String address) {
        super(name, address);
    }

    public Integer getBedroomsAmount() {
        return bedroomsAmount;
    }

    public String getKitchenType() {
        return kitchenType;
    }

    public boolean isHasGrill() {
        return hasGrill;
    }

    public boolean isHasYard() {
        return hasYard;
    }

    public boolean isHasBalcony() {
        return hasBalcony;
    }

    public boolean isHasGarage() {
        return hasGarage;
    }

    @Override
    public String getType() {
        return "Vivienda";
    }
}
