package propertyAdmin.property.structure;

import propertyAdmin.property.details.Blueprint;
import propertyAdmin.property.details.Deed;
import propertyAdmin.rents.Expenses;
import propertyAdmin.services.Services;
import propertyAdmin.taxes.Taxes;

import javax.persistence.*;
import java.io.File;
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
   @CollectionTable @OneToMany
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
   @Column(name = "IMAGE")
   private File file;

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
      file = null;
   }


   public String getName() {
      return name;
   }

   public String getAddress() {
      return address;
   }

   public Blueprint getBlueprint() {
      return blueprint;
   }

   public Deed getDeed() {
      return deed;
   }

   public Services getServices() {
      return services;
   }

   public Taxes getTaxes() {
      return taxes;
   }

   public String getDescription() {
      return description;
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

   public void setImage(File image) {
      this.file = image;
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

   @Override
   public String toString() {
      String details = "\nNombre: " + name + "\nDireccion: "+ address + "\nDescripcion: " + description + "\nDetalles plano: " + blueprint.toString() + "" +
              "\nDetalles escritura: " + deed.toString() + "\nServicios: " + services.toString() + "\nImpuestos: " + taxes.toString() + "\nExpensas: " + expenses.toString();
      String functionalUnitsString = "";
      for (int i = 0; i < functionalUnits.size(); i++) {
         functionalUnitsString += functionalUnits.get(i).toString() + "\n";
      }
      return details + "\n" + functionalUnitsString;
   }
}
