package propertyAdmin.structure.persons;

import propertyAdmin.structure.property.FunctionalUnit;

import javax.persistence.*;

@Entity
@Table(name = "TENANT")
public class Tenant {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
    @Column (name = "NAME")
    private String name;
    @Column (name = "SURNAME")
    private String surname;
    @Column(name = "DNI")
    private String dni;
    @Column (name = "NATIONALITY")
    private String nationality;
    @Column (name = "ADDRESS")
    private String address;
    @Column (name = "ADDRESS_COUNTRY")
    private String addressCountry;
    @Column (name = "ADDRESS_PROVINCE")
    private String addressProvince;
    @Column (name = "ADDRESS_CITY")
    private String addressCity;
    @Column (name = "ADDRESS_TOWN")
    private String addressTown;
    @Column (name = "ADDRESS_ZIPCODE")
    private String addressZipCode;
    @Column (name = "ADDRESS_PHONE")
    private String phone;
    @Column(name = "EMAIL")
    private String email;
    @OneToOne(cascade = CascadeType.ALL)
    private FunctionalUnit functionalUnit;

    public Tenant(String name, String surname, String dni, String nationality, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email) {
        this.name = name;
        this.surname = surname;
        this.dni = dni;
        this.nationality = nationality;
        this.address = address;
        this.addressCountry = addressCountry;
        this.addressProvince = addressProvince;
        this.addressCity = addressCity;
        this.addressTown = addressTown;
        this.addressZipCode = addressZipCode;
        this.phone = phone;
        this.email = email;
        this.functionalUnit = getFunctionalUnit();
    }

    public Tenant(String name, String surname, String dni, String phone, String email) {
        this.name = name;
        this.surname = surname;
        this.dni = dni;
        this.functionalUnit = getFunctionalUnit();
        this.phone = phone;
        this.email = email;
        this.address = null;
        this.addressTown = null;
        this.addressCity = null;
        this.addressProvince = null;
        this.addressCountry = null;
        this.addressZipCode= null;
    }

    public Tenant() {
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getDni() {
        return dni;
    }

    public void setFunctionalUnit(FunctionalUnit newFunctionalUnit) {
        this.functionalUnit = newFunctionalUnit;
    }

    public FunctionalUnit getFunctionalUnit() {
        return functionalUnit;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getNationality() {
        return nationality;
    }

    public String getAddress() {
        return address;
    }

    public String getAddressCountry() {
        return addressCountry;
    }

    public String getAddressProvince() {
        return addressProvince;
    }

    public String getAddressCity() {
        return addressCity;
    }

    public String getAddressTown() {
        return addressTown;
    }

    public String getAddressZipCode() {
        return addressZipCode;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "Tenant{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", id='" + id + '\'' +
                ", nationality='" + nationality + '\'' +
                ", address='" + address + '\'' +
                ", addressCountry='" + addressCountry + '\'' +
                ", addressProvince='" + addressProvince + '\'' +
                ", addressCity='" + addressCity + '\'' +
                ", addressTown='" + addressTown + '\'' +
                ", addressZipCode='" + addressZipCode + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public String getFullName() {
        return name + " " + surname;
    }

}
