package propertyAdmin.web.taxes;

import javax.persistence.*;

@Entity
@Table(name = "TAXES")
public class Taxes {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;

   public Taxes() {
   }
}
