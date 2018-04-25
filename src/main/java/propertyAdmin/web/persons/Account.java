package propertyAdmin.web.persons;

import propertyAdmin.web.property.structure.Property;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table (name = "ACCOUNTS")
public class   Account {

   @Column(name = "NAME")
   private String name;
   @Column(name = "SURNAME")
   private String surname;
   @Column(name = "ID")
   private String id;
   @Column(name = "NATIONALITY")
   private String nationality;
   @Column(name = "MARITAL_STATUS")
   private String maritalStatus;
   @Column(name = "ADDRESS")
   private String address;
   @Column(name = "ADDRESS_COUNTRY")
   private String addressCountry;
   @Column(name = "ADDRESS_PROVINCE")
   private String addressProvince;
   @Column(name = "ADDRESS_CITY")
   private String addressCity;
   @Column(name = "ADDRESS_TOWN")
   private String addressTown;
   @Column(name = "ADDRESS_ZIPCODE")
   private String addressZipCode;
   @Column(name = "PHONE")
   private String phone;
   @Id @Column(name = "EMAIL", unique = true)
   private String email;
   @Column(name = "PASSWORD")
   private String password;
   @CollectionTable @OneToMany
   private List<Property> properties;
   private boolean logged;

    public Account(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email, String password) {
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
       this.password = password;
       properties = new ArrayList<>();
       logged = true;
    }

   public Account() {
   }

   public void setLogged(boolean logged) {
      this.logged = logged;
   }

   public String getName() {
      return name;
   }
   public String getSurname() {
      return surname;
   }
   public String getId() {
      return id;
   }
   public String getNationality() {
      return nationality;
   }
   public String getMaritalStatus() {
      return maritalStatus;
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
   public String getPassword() {
      return password;
   }
   public List<Property> getProperties() {
      return properties;
   }
   public void addProperty(Property property) {
       properties.add(property);
   }
   public Property getSpecificPropertyById(Integer id) {
       for (Property property : properties) {
          if (property.getId().equals(id)) {
             return property;
          } else {
             System.out.println("NOT FOUND");
          }
       } return null;
   }
   public Property getSpecificPropertyByIndex(int index) {
       return properties.get(index);
   }
   public void removeProperty(Property property) {
       properties.remove(property);
   }
   public boolean isLogged() {
      return logged;
   }

   @Override
   public String toString() {
      return "Name: " + name + "\n" + "Surname: " + surname + "\n" + "ID: " + id + "\n" + "Nationality: " + nationality + "\n" +
              "" + "Marital Status: " + maritalStatus + "\n" + "Country: "+ addressCountry + "\n" + "Province: " + addressProvince + "\n" +
              "" + "City: " +addressCity + "\n" + "Town: "+ addressTown+"\n" + "Address: " +address+ "\n" + "Zip Code: " + addressZipCode+ "\n" +
              "" + "Phone: "+ phone+ "\n" + "Mail: " + email+"\n" + "Password: " +password +"\n";
   }
}
