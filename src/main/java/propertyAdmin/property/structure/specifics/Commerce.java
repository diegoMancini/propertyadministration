package propertyAdmin.property.structure.specifics;

import propertyAdmin.property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public abstract class Commerce extends FunctionalUnit {

   @Column(name = "CURTAIN_TYPE")
   private String curtainType;

   public Commerce(String name, String type, String address) {
      super(name,type, address);
   }

   public Commerce() {}
}