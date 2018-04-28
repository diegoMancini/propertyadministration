package propertyAdmin.structure.property.details;

import javax.persistence.*;

@Entity
@Table(name = "BLUEPRINT")
public class Blueprint {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;
   @Column(name = "NAME")
   private String name;

   public Blueprint() {
   }

   public Blueprint(String name) {
      this.name = name;
   }

   public Integer getId() {
      return id;
   }

   public String getName() {
      return name;
   }

   @Override
   public String toString() {
      return "Blueprint{" +
              "id=" + id +
              ", name='" + name + '\'' +
              '}';
   }
}
