package propertyAdmin.persons;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TENANT")
public class Tenant {

    @Column (name = "NAME")
    private String name;
    @Column (name = "SURNAME")
    private String surname;
    @Id @Column (name = "ID")
    private String id;
    @Column (name = "NATIONALITY")
    private String nationality;
    @Column (name = "MARITAL_STATUS")
    private String maritalStatus;
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
    @Column(name = "EMAIL", unique = true)
    private String email;

    public Tenant() {
    }

    public Tenant(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email) {
        this.name = name;
        this.surname = surname;
        this.id = id;
        this.nationality = nationality;
        this.maritalStatus = maritalStatus;
        this.address = address;
        this.addressCountry = addressCountry;
        this.addressProvince = addressProvince;
        this.addressCity = addressCity;
        this.addressTown = addressTown;
        this.addressZipCode = addressZipCode;
        this.phone = phone;
        this.email = email;
    }
}
