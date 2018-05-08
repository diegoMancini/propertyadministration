package propertyAdmin.structure.property;

import javax.persistence.*;

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
    @Column(name = "COUNTRY")
    private String country; //Argentina
    @Column(name = "PROVINCE")
    private String province; //Buenos Aires
    @Column(name = "CITY")
    private String city; //Malvinas Argentinas
    @Column(name = "TOWN")
    private String town; //Grand Bourg
    @OneToOne(cascade = {CascadeType.ALL})
    private Contract contract;
    @Column(name = "PHONE")
    private String phone;
    @Column(name = "TYPE")
    private String type;
    @Column(name = "BUSINESS_TYPE") //Vivienda, heladeria, consultorio odontologico, etc
    private String businessType;
    @Column(name = "BATH_AMOUNT")
    private Integer bathroomsAmount;
    @Column(name = "KITCHEN_FURNITURE")
    private String kitchenFurniture;
    @Column(name = "BEDROOM_FURNITURE")
    private String bedroomFurniture;
    @Column(name = "BATHROOM_FURNITURE")
    private String bathFurniture;
    @Column(name = "IS_DELETED")
    private boolean deleted;

    public FunctionalUnit() {
    }

    public FunctionalUnit(String name,String country, String province, String city, String town, String address) {
        this.name = name;
        this.address = address;
        this.country = country;
        this.province = province;
        this.city = city;
        this.town = town;
        this.bathroomsAmount = 0;
        this.phone = "0800PANZON";
        this.businessType = "ALQUILER";
        this.kitchenFurniture = "COCINA COMEDOR";
        this.bedroomFurniture = "CAMA";
        this.bathFurniture = "NADA";
        contract = null;
        deleted = false;
        type = getType();
    }

    public FunctionalUnit(String name, String country, String province, String city, String town, String address, Integer bathroomsAmount, String phone, String businessType,
                          String kitchenFurniture, String bedroomFurniture, String bathFurniture) {
        this.name = name;
        this.address = address;
        this.country = country;
        this.province = province;
        this.city = city;
        this.town = town;
        this.bathroomsAmount = bathroomsAmount;
        this.phone = phone;
        this.businessType = businessType;
        this.kitchenFurniture = kitchenFurniture;
        this.bedroomFurniture = bedroomFurniture;
        this.bathFurniture = bathFurniture;
        contract = null;
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
        addFunctionalUnitToTenant();
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

    public String getCountry() {
        return country;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }

    public String getTown() {
        return town;
    }

    public abstract String getType();

    public boolean hasContract() {
        if (contract == null) {
            return false;
        } else {
            return true;
        }
    }
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

    public String getState() {
        String state = "";
        if (hasContract()) {
            state += "Ocupado";
        } else {
            state += "Libre";
        } return state;
    }

    public String getFullAddress() {
        return address + ", " + town + ", " + city + ", " + country;
    }

    private void addFunctionalUnitToTenant() {
        contract.getTenant().setFunctionalUnit(this);
    }

    public String getCommercialAddress() {
        return address + ", " + town ;
    }
}
