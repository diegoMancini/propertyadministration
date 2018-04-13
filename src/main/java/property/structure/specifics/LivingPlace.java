package property.structure.specifics;

import property.structure.FunctionalUnit;

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
}
