package propertyAdmin.services;

import javax.persistence.*;

@Entity
@Table(name = "SERVICES")
public abstract class Services {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;

   public Services() {
   }
}
