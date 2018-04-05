package property;

import javax.persistence.*;

@Entity
@Table(name = "PROPERTY")
public abstract class Property {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ACCOUNT_ID")
   @JoinColumn(name = "accountID")
   private Integer propertyID;
//   @Column(name = "DEED")
//   private Deed deed; //Escritura
//   @Column(name = "SERVOCES")
//   private Services services; //Luz, gas, tel
//   @Column(name = "TAXES")
//   private Taxes taxes;
//   @Column(name = "TYPE")
//   private String type;
//   @Column(name = "LEGAL_ADDRESS")
//   private String legalAddress;
//   @Column(name = "BLUEPRINT")
//   private Blueprint blueprint;
//   @Column(name = "FUNCTIONAL_UNIT")
//   private FunctionalUnit functionalUnit;

}
