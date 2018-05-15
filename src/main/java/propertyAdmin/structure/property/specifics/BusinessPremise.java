package propertyAdmin.structure.property.specifics;

import propertyAdmin.structure.property.FunctionalUnit;

import javax.persistence.*;

@Entity
public class BusinessPremise extends FunctionalUnit {

   public BusinessPremise() {
   }

   public BusinessPremise(String name, String address) {
      super(name,address);
   }

   @Override
   public String getType() {
      return "Local";
   }


}
