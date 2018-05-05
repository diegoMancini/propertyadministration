package propertyAdmin.structure.property.structure.specifics;

import propertyAdmin.structure.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class BusinessPremise extends FunctionalUnit {

   @Column(name = "HAS_SHOP_WINDOW")
   private boolean hasShopWindow;

   public BusinessPremise() {
   }

   public BusinessPremise(String name, String country, String province, String city, String town, String address) {
      super(name, country, province, city, town,address);
   }

   public boolean isHasShopWindow() {
      return hasShopWindow;
   }

   @Override
   public String getType() {
      return "Local";
   }


}
