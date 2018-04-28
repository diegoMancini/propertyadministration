package propertyAdmin.structure.property.structure.specifics;

import propertyAdmin.structure.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public class BusinessPremise extends FunctionalUnit {

   @Column(name = "HAS_SHOP_WINDOW")
   private boolean hasShopWindow;

   public BusinessPremise() {
   }

   public BusinessPremise(String name, String address) {
      super(name, address);
   }

   public boolean isHasShopWindow() {
      return hasShopWindow;
   }

   @Override
   public String getType() {
      return "Local comercial";
   }


}
