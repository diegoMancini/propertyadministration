package propertyAdmin.web.property.details;

import javax.persistence.*;

@Entity
@Table(name = "DEED")
public class Deed {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;
   @Column(name = "NAME")
   private String name;
   @Column(name = "LEGAL_ADDRESS")
   private String legalAddress;

   public Deed() {
   }

   public Deed(String name, String legalAddress) {
      this.name = name;
      this.legalAddress = legalAddress;
   }

   public Integer getId() {
      return id;
   }

   public String getName() {
      return name;
   }

   public String getLegalAddress() {
      return legalAddress;
   }

   @Override
   public String toString() {
      return "Deed{" +
              "id=" + id +
              ", name='" + name + '\'' +
              ", legalAddress='" + legalAddress + '\'' +
              '}';
   }
}
