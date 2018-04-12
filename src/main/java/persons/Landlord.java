package persons;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LANDLORD")
public class Landlord {

   @Column(name = "NAME")
   private String name;
   @Column(name = "SURNAME")
   private String surname;
   @Id @Column(name = "ID", unique = true)
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

   public Landlord(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone) {
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
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getSurname() {
      return surname;
   }

   public void setSurname(String surname) {
      this.surname = surname;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getNationality() {
      return nationality;
   }

   public void setNationality(String nationality) {
      this.nationality = nationality;
   }

   public String getMaritalStatus() {
      return maritalStatus;
   }

   public void setMaritalStatus(String maritalStatus) {
      this.maritalStatus = maritalStatus;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getAddressCountry() {
      return addressCountry;
   }

   public void setAddressCountry(String addressCountry) {
      this.addressCountry = addressCountry;
   }

   public String getAddressProvince() {
      return addressProvince;
   }

   public void setAddressProvince(String addressProvince) {
      this.addressProvince = addressProvince;
   }

   public String getAddressCity() {
      return addressCity;
   }

   public void setAddressCity(String addressCity) {
      this.addressCity = addressCity;
   }

   public String getAddressTown() {
      return addressTown;
   }

   public void setAddressTown(String addressTown) {
      this.addressTown = addressTown;
   }

   public String getAddressZipCode() {
      return addressZipCode;
   }

   public void setAddressZipCode(String addressZipCode) {
      this.addressZipCode = addressZipCode;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }
}
