package propertyAdmin.structure.property.structure.specifics;

import propertyAdmin.structure.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class Office extends FunctionalUnit {


   public Office(String name, String country, String province, String city, String town, String address) {
      super(name, country,province,city,town,address);
   }

   public Office() {
   }

   @Override
   public String getType() {
      return "Oficina";
   }
}
