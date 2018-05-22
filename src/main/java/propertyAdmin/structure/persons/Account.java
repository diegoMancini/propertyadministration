package propertyAdmin.structure.persons;

import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

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
   @Id @Column(name = "USERNAME", unique = true)
   private String username;
   @Column(name = "ID")
   private String id;
   @Column(name = "NATIONALITY")
   private String nationality;
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
   @Column(name = "EMAIL", unique = true)
   private String email;
   @Column(name = "PASSWORD")
   private String password;
   @Column(name = "IMAGE_LINK")
   private String imageLink;
   @CollectionTable @OneToMany
   private List<Property> properties;

    public Account(String name, String surname, String id, String nationality, String address, String addressCountry,
                   String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone,
                   String email, String password, String username) {
       this.name = name;
       this.surname = surname;
       this.id = id;
       this.nationality = nationality;
       this.address = address;
       this.addressCountry = addressCountry;
       this.addressProvince = addressProvince;
       this.addressCity = addressCity;
       this.addressTown = addressTown;
       this.addressZipCode = addressZipCode;
       this.phone = phone;
       this.email = email;
       this.password = password;
       this.username = username;
       properties = new ArrayList<>();
       imageLink = "";
    }

   public Account() {
   }


   public Account(String name, String surname, String username, String nationality, String phone, String email, String password) {
      this.name = name;
      this.surname = surname;
      this.username = username;
      this.nationality = nationality;
      this.phone = phone;
      this.email = email;
      this.id = null;
      addressCountry = null;
      address = null;
      addressProvince = null;
      addressCity = null;
      addressTown = null;
      addressZipCode = null;
      this.password = password;
      properties = new ArrayList<>();
      imageLink = "";

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

   public String getImageLink() {
      return imageLink;
   }

   public void setImageLink(String imageLink) {
      this.imageLink = imageLink;
   }

   public Integer getAmountOfProperties() {
      return getProperties().size();
   }
   public Integer getAmountOfFunctionalUnits() {
      Integer res = 0;
      for (Property property:getProperties()) {
         res += property.getFunctionalUnits().size();
      }
      return res;
   }
   public Integer getAmountOfOccupiedFunctionalUnits() {
      Integer res = getAmountOfFunctionalUnits();
      for (Property property:properties) {
         for (FunctionalUnit functionalUnit: property.getFunctionalUnits()) {
            if (!functionalUnit.hasContract()) {
               res--;
            }
         }
      }
      return res;
   }

   public void removeProperty(Property property) {
        property.setDeleted(true);
   }

   public Property getSpecificPropertyByIndex(int index) {
       return properties.get(index);
   }

    public String getUsername() {
        return username;
    }

    @Override
    public String toString() {
        return "Account{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", username='" + username + '\'' +
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
                ", password='" + password + '\'' +
                ", properties=" + properties +
                '}';
    }

   public Property getSpecificProperty(Integer chosenProperty) {
      return null;
   }

   public String getFullName() {
      return name + " " + surname;
   }

   public String getFullAddress() {
      return address + ", " + addressTown + ", " + addressCity + ", " + addressProvince + ", " +addressCountry;
   }
}
