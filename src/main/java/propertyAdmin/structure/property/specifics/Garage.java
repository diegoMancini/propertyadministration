package propertyAdmin.structure.property.specifics;

import propertyAdmin.structure.property.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Garage extends FunctionalUnit {

   public Garage() {
   }

   public Garage(String name, String country, String province, String city, String town, String address) {
      super(name,country,province,city,town, address);
   }

   @Override
   public String getType() {
      return "Garage";
   }
}