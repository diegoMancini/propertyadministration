package propertyAdmin.structure.persons;

import javax.persistence.*;

@Entity
@Table(name = "GUARANTOR")
public class Guarantor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
   @Column(name = "FULL_NAME")
   private String fullName;
    @Column(name = "DNI")
    private String dni;
   @Column (name = "ADDRESS_PHONE")
   private String phone;
   @Column(name = "EMAIL", unique = true)
   private String email;

   public Guarantor() {
   }

   public Guarantor(String fullName,String dni, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email) {
      this.fullName = fullName;
      this.dni = dni;
      this.phone = phone;
      this.email = email;
   }

   public Guarantor(String fullName, String phone, String dni) {
      this.fullName = fullName;
      this.phone = phone;
      this.dni = dni;
   }

    public Integer getId() {
        return id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

   public String getPhone() {
      return phone;
   }

   public String getEmail() {
      return email;
   }

    public String getFullName() {
        return fullName;
    }

    @Override
   public String toString() {
      return "Guarantor{" +
              ", id='" + id + '\'' +
              ", phone='" + phone + '\'' +
              ", email='" + email + '\'' +
              '}';
   }
}
