package propertyAdmin.structure.persons;

import javax.persistence.*;

@Entity
@Table(name = "GUARANTOR")
public class Guarantor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
   @Column(name = "NAME")
   private String name;
   @Column (name = "SURNAME")
   private String surname;
    @Column(name = "DNI")
    private String dni;
   @Column (name = "ADDRESS_PHONE")
   private String phone;
   @Column(name = "EMAIL", unique = true)
   private String email;

   public Guarantor() {
   }

   public Guarantor(String name, String surname, String dni, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email) {
      this.name = name;
      this.surname = surname;
      this.dni = dni;
      this.phone = phone;
      this.email = email;
   }

   public Guarantor(String name, String surname, String dni) {
      this.name = name;
      this.surname = surname;
      this.dni = dni;
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

    public void setDni(String dni) {
        this.dni = dni;
    }

   public String getPhone() {
      return phone;
   }

   public String getEmail() {
      return email;
   }

   @Override
   public String toString() {
      return "Guarantor{" +
              "name='" + name + '\'' +
              ", surname='" + surname + '\'' +
              ", id='" + id + '\'' +
              ", phone='" + phone + '\'' +
              ", email='" + email + '\'' +
              '}';
   }
}
