package persons;

import java.util.ArrayList;
import java.util.List;

public class Owner {

   private String name;
   private String surname;
   private String id;
   private String nationality;
   private String civilStatus;
   private String address;
   private String addressCountry;
   private String addressProvince;
   private String addressCity;
   private String addressTown;
   private String addressZipCode;
   private String phone;

   public Owner(String name, String surname, String id, String nationality, String civilStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone) {
      this.name = name;
      this.surname = surname;
      this.id = id;
      this.nationality = nationality;
      this.civilStatus = civilStatus;
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

   public String getCivilStatus() {
      return civilStatus;
   }

   public void setCivilStatus(String civilStatus) {
      this.civilStatus = civilStatus;
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
