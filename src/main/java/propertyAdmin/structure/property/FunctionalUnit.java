package propertyAdmin.structure.property;

import propertyAdmin.structure.persons.Tenant;

import javax.persistence.*;
import java.util.List;

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
    @Column(name = "PHONE")
    private String phone;
    @Column(name = "TYPE")
    private String type;
    @Column(name = "BUSINESS_TYPE") //Vivienda, heladeria, consultorio odontologico, etc
    private String businessType;

    public FunctionalUnit() {
    }

    public FunctionalUnit(String name,String address) {
        this.name = name;
        this.address = address;
        contract = null;
        type = getType();
    }

    public FunctionalUnit(String name, String address, String businessType) {
        this.name = name;
        this.address = address;
        this.businessType = businessType;
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

    public abstract String getType();

    public boolean hasContract() {
        if (contract == null) {
            return false;
        } else {
            return true;
        }
    }


    @Override
    public String toString() {
        return "Unidad funcional: " +
                "Nombre: " + name + '\'' +
                ", Tipo: " + type + '\'' +
                ", Direccion: " + address + '\'' +
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
    
    private void addFunctionalUnitToTenant() {
        contract.getTenant().setFunctionalUnit(this);
    }


}
