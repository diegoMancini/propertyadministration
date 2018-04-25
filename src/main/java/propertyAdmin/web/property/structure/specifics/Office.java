package propertyAdmin.web.property.structure.specifics;

import propertyAdmin.web.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Office extends FunctionalUnit {


   public Office(String name, String address) {
      super(name, address);
   }

   public Office() {
   }

   @Override
   public String getType() {
      return "Oficina";
   }
}
