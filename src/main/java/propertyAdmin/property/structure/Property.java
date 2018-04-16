package propertyAdmin.property.structure;

import propertyAdmin.property.details.Blueprint;
import propertyAdmin.property.details.Deed;
import propertyAdmin.rents.Expenses;
import propertyAdmin.services.Services;
import propertyAdmin.taxes.Taxes;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "PROPERTY")
public class Property {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;
   @Column(name = "NAME")
   private String name;
   @Column(name = "DESCRIPTION")
   private String description;
   @Column(name = "ADDRESS")
   private String address;
   @OneToOne(cascade = {CascadeType.ALL})
   private Blueprint blueprint;
   @OneToOne(cascade = {CascadeType.ALL})
   private Deed deed; //Escritura
   @OneToOne(cascade = {CascadeType.ALL})
   private Services services; //Luz, gas, tel
   @OneToOne(cascade = {CascadeType.ALL})
   private Taxes taxes;
   @OneToMany
   private List<FunctionalUnit> functionalUnits;
   @Column(name = "AMOUNT_OF_FUNCTIONAL_UNITS")
   private Integer totalAmount;
   @Column(name = "AMOUNT_LIVING_PLACE")
   private Integer amountLivingPlace;
   @Column(name = "AMOUNT_OFFICE")
   private Integer amountOffice;
   @Column(name = "AMOUNT_BUSINESS_PREMISE")
   private Integer amountBusinessPremise;
   @Column(name = "AMOUNT_GARAGE")
   private Integer amountGarage;
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Expenses> expenses;

   public Property() {
   }

   public Property(String name, String description, String address) {
      this.name = name;
      this.description = description;
      this.blueprint = null;
      this.deed = null;
      this.services = null;
      this.taxes = null;
      this.address = address;
      functionalUnits = new ArrayList<>();
      totalAmount = 0;
      amountLivingPlace =0;
      amountOffice = 0;
      amountBusinessPremise = 0;
      amountGarage = 0;
   }

   public Integer getPropertyID() {
      return id;
   }

   public void setPropertyID(Integer propertyID) {
      this.id = propertyID;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
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

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public Integer getId() {
      return id;
   }

   public List<FunctionalUnit> getFunctionalUnits() {
      return functionalUnits;
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

   public Integer getAmountBusinessPremise() {
      return amountBusinessPremise;
   }

   public Integer getAmountGarage() {
      return amountGarage;
   }

   public void addFunctionalUnit(FunctionalUnit functionalUnit) {
      functionalUnits.add(functionalUnit);
      totalAmount++;
      switch (functionalUnit.getType()) {
         case "Living Place" : amountLivingPlace++;
         case "Office": amountOffice++;
         case "Business Premise": amountBusinessPremise++;
         case "Garage": amountGarage++;
         default: break;
      }
   }
}
