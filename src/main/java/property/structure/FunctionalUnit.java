package property.structure;

import rents.Contract;

import javax.persistence.*;
import java.util.HashMap;

@Entity
@Table(name = "FUNCTIONAL_UNITS")
public abstract class FunctionalUnit {

    @Id @Column(name = "NAME")
    private String name;
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "CONTRACT")
    private Contract contract;
    @Column(name = "BATH_AMOUNT")
    private Integer bathroomsAmount;
    @Column(name = "PHONE")
    private String phone;
    @Column(name = "TYPE")
    private String type;
    @Column(name = "BUSINESS_TYPE") //Vivienda, heladeria, consultorio odontologico, etc
    private String businessType;
//    @OneToMany
//    private HashMap<String, String> furnitureMap;

    public FunctionalUnit() {
    }
}
