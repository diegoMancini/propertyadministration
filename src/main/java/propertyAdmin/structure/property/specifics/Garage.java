package propertyAdmin.structure.property.specifics;

import propertyAdmin.structure.property.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Garage extends FunctionalUnit {

   public Garage() {
   }

   public Garage(String name, String address) {
      super(name,address);
   }

   @Override
   public String getType() {
      return "Garage";
   }
}
