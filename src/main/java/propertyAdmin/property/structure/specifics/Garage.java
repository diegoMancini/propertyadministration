package propertyAdmin.property.structure.specifics;

import propertyAdmin.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Garage extends FunctionalUnit {

   public Garage() {
   }

   public Garage(String name, String type, String address) {
      super(name, type, address);
   }
}
