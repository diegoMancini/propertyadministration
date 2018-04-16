package propertyAdmin.property.structure;

import propertyAdmin.rents.Contract;

import javax.persistence.*;

@Entity
@Table(name = "FUNCTIONAL_UNITS")

public abstract class FunctionalUnit {

    @Id @Column(name = "NAME")
    private String name;
    @Column(name = "ADDRESS")
    private String address;
    @OneToOne(cascade = {CascadeType.ALL})
    private Contract contract;
    @Column(name = "BATH_AMOUNT")
    private Integer bathroomsAmount;
    @Column(name = "PHONE")
    private String phone;
    @Column(name = "TYPE")
    private String type;
    @Column(name = "BUSINESS_TYPE") //Vivienda, heladeria, consultorio odontologico, etc
    private String businessType;
    @Column(name = "KITCHEN_FURNITURE")
    private String kitchenFurniture;
    @Column(name = "BEDROOM_FURNITURE")
    private String bedroomFurniture;
    @Column(name = "BATHROOM_FURNITURE")
    private String bathFurniture;

    public FunctionalUnit() {
    }

    public FunctionalUnit(String name, String address, Integer bathroomsAmount, String phone, String type, String businessType, String kitchenFurniture, String bedroomFurniture, String bathFurniture) {
        this.name = name;
        this.address = address;
        this.bathroomsAmount = bathroomsAmount;
        this.phone = phone;
        this.type = type;
        this.businessType = businessType;
        this.kitchenFurniture = kitchenFurniture;
        this.bedroomFurniture = bedroomFurniture;
        this.bathFurniture = bathFurniture;
        contract = null;
    }

    public FunctionalUnit(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public Contract getContract() {
        return contract;
    }

    public Integer getBathroomsAmount() {
        return bathroomsAmount;
    }

    public String getPhone() {
        return phone;
    }

    public String getType() {
        return type;
    }

    public String getBusinessType() {
        return businessType;
    }
}
