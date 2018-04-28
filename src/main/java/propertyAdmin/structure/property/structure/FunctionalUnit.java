package propertyAdmin.structure.property.structure;

import propertyAdmin.structure.rents.Contract;

import javax.persistence.*;
import java.io.File;

@Entity
@Table(name = "FUNCTIONAL_UNITS")

public abstract class FunctionalUnit {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
    @Column(name = "NAME")
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
    @Column(name = "IMAGE")
    private File file;
    @Column(name = "IS_DELETED")
    private boolean deleted;

    public FunctionalUnit() {
    }

    public FunctionalUnit(String name, String address) {
        this.name = name;
        this.address = address;
        this.bathroomsAmount = 0;
        this.phone = "0800PANZON";
        this.businessType = "ALQUILER";
        this.kitchenFurniture = "COCINA COMEDOR";
        this.bedroomFurniture = "CAMA";
        this.bathFurniture = "NADA";
        contract = null;
        type = getType();
        deleted = false;
    }

    public FunctionalUnit(String name, String address, Integer bathroomsAmount, String phone, String businessType,
                          String kitchenFurniture, String bedroomFurniture, String bathFurniture) {
        this.name = name;
        this.address = address;
        this.bathroomsAmount = bathroomsAmount;
        this.phone = phone;
        this.businessType = businessType;
        this.kitchenFurniture = kitchenFurniture;
        this.bedroomFurniture = bedroomFurniture;
        this.bathFurniture = bathFurniture;
        contract = null;
//        file = null;
        type = getType();
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public Contract getContract() {
        return contract;
    }
    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Integer getBathroomsAmount() {
        return bathroomsAmount;
    }
    public void setBathroomsAmount(Integer bathroomsAmount) {
        this.bathroomsAmount = bathroomsAmount;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBusinessType() {
        return businessType;
    }
    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getKitchenFurniture() {
        return kitchenFurniture;
    }
    public void setKitchenFurniture(String kitchenFurniture) {
        this.kitchenFurniture = kitchenFurniture;
    }

    public String getBedroomFurniture() {
        return bedroomFurniture;
    }
    public void setBedroomFurniture(String bedroomFurniture) {
        this.bedroomFurniture = bedroomFurniture;
    }

    public String getBathFurniture() {
        return bathFurniture;
    }
    public void setBathFurniture(String bathFurniture) {
        this.bathFurniture = bathFurniture;
    }

    public File getFile() {
        return file;
    }
    public void setFile(File file) {
        this.file = file;
    }

    public abstract String getType();

    public void setDeleted(boolean b) {
        deleted = b;
    }

    public boolean isDeleted() {
        return deleted;
    }

    @Override
    public String toString() {
        return "Unidad funcional: " +
                "Nombre: " + name + '\'' +
                ", Tipo: " + type + '\'' +
                ", Direccion: " + address + '\'' +
                ", Baños: " + bathroomsAmount +
                ", Telefono: " + phone + '\'';
    }
}
