package property.structure;

import com.google.common.collect.ArrayListMultimap;
import property.details.Blueprint;
import property.details.Deed;
import services.Services;
import taxes.Taxes;

import javax.persistence.*;

import static com.google.api.client.util.ArrayMap.create;

@Entity
@Table(name = "PROPERTY")
public abstract class Property {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ACCOUNT_ID")
   @JoinColumn(name = "accountID")
   private Integer propertyID;
   @Column(name = "NAME")
   private String name;
   @Column(name = "BLUEPRINT")
   private Blueprint blueprint;
   @Column(name = "DEED")
   private Deed deed; //Escritura
   @Column(name = "SERVICES")
   private Services services; //Luz, gas, tel
   @Column(name = "TAXES")
   private Taxes taxes;
   @Column(name = "TYPE")
   private String type;
   @Column(name = "DESCRIPTION")
   private String description;
   @OneToMany
   private ArrayListMultimap<String,Object> functionalUnits;
   @Column(name = "AMOUNT_OF_FUNCTIONAL_UNITS")
   private Integer totalAmount = functionalUnits.size();
   @Column(name = "AMOUNT_LIVING_PLACE")
   private Integer amountLivingPlace = functionalUnits.get("Living Place").size();
   @Column(name = "AMOUNT_OFFICE")
   private Integer amountOffice = functionalUnits.get("Office").size();
   @Column(name = "AMOUNT_COMMERCE")
   private Integer amountCommerce = functionalUnits.get("Commerce").size();
   @Column(name = "AMMOUNT_GARAGE")
   private Integer amountGarage = functionalUnits.get("Garage").size();

   public Property() {
   }

   public Property(String name, String type, String description) {
      this.name = name;
      this.type = type;
      this.description = description;
      this.blueprint = null;
      this.deed = null;
      this.services = null;
      this.taxes = null;
      functionalUnits = ArrayListMultimap.create();
      functionalUnits.put("Living Place" , null);
      functionalUnits.put("Office" , null);
      functionalUnits.put("Commerce" , null);
      functionalUnits.put("Garage" , null);
   }

   public Integer getPropertyID() {
      return propertyID;
   }

   public void setPropertyID(Integer propertyID) {
      this.propertyID = propertyID;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public Blueprint getBlueprint() {
      return blueprint;
   }

   public void setBlueprint(Blueprint blueprint) {
      this.blueprint = blueprint;
   }

   public Deed getDeed() {
      return deed;
   }

   public void setDeed(Deed deed) {
      this.deed = deed;
   }

   public Services getServices() {
      return services;
   }

   public void setServices(Services services) {
      this.services = services;
   }

   public Taxes getTaxes() {
      return taxes;
   }

   public void setTaxes(Taxes taxes) {
      this.taxes = taxes;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public Integer getTotalAmount() {
      return totalAmount;
   }

   public Integer getAmountLivingPlace() {
      return amountLivingPlace;
   }

   public Integer getAmountOffice() {
      return amountOffice;
   }

   public Integer getAmountCommerce() {
      return amountCommerce;
   }

   public Integer getAmountGarage() {
      return amountGarage;
   }

   public ArrayListMultimap<String, Object> getFunctionalUnits() {
      return functionalUnits;
   }
}
