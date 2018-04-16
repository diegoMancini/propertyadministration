package propertyAdmin.property.structure.specifics;

import javax.persistence.*;

@Entity
public class BusinessPremise extends Commerce {

   @Column(name = "HAS_SHOP_WINDOW")
   private boolean hasShopWindow;

   public BusinessPremise() { }

   public BusinessPremise(String name, String type) {
      super(name, type);
   }
}
