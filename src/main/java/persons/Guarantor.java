package persons;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GUARANTOR")
public class Guarantor {

   @Column(name = "NAME")
   private String name;
   @Column (name = "SURNAME")
   private String surname;
   @Id
   @Column (name = "ID")
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

   public Guarantor() {
   }
}
