package property.structure.specifics;

import property.structure.FunctionalUnit;

import javax.persistence.*;

@Entity
public abstract class Commerce extends FunctionalUnit {

   @Column(name = "CURTAIN_TYPE")
   private String curtainType;

   public Commerce() {
   }
}
