package propertyAdmin.property.structure.specifics;

import propertyAdmin.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Garage extends FunctionalUnit {

   public Garage() {
   }

   public Garage(String name, String address) {
      super(name, address);
   }

   @Override
   public String getType() {
      return "Garage";
   }
}
