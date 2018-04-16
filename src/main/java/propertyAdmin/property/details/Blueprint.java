package propertyAdmin.property.details;

import javax.persistence.*;

@Entity
@Table(name = "BLUEPRINT")
public class Blueprint {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;

   public Blueprint() {
   }
}
