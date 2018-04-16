package propertyAdmin.property.details;

import javax.persistence.*;

@Entity
@Table(name = "DEED")
public class Deed {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;

   @Column(name = "LEGAL_ADDRESS")
   private String legalAddress;

   public Deed() {
   }
}
