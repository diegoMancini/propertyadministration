package propertyAdmin.property.structure.specifics;

import javax.persistence.*;

@Entity
public class Office extends Commerce {

   public Office() {
   }

   public Office(String name, String type, String address) {
      super(name, type, address);
   }
}
