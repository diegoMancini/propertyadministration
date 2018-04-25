package propertyAdmin.web.property.structure;

import propertyAdmin.web.property.details.Blueprint;
import propertyAdmin.web.property.details.Deed;
import propertyAdmin.web.rents.Expenses;
import propertyAdmin.web.services.Services;
import propertyAdmin.web.taxes.Taxes;

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
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Services> services; //Luz, gas, tel
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Taxes> taxes;
   @CollectionTable @OneToMany
   private List<FunctionalUnit> functionalUnits;
   @Column(name = "AMOUNT_OF_FUNCTIONAL_UNITS")
   private Integer totalAmount;
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Expenses> expenses;
   @Column(name = "IMAGE")
   private File file;

   public Property() {
   }

   public Property(String name, String description, String address) {
      this.name = name;
      this.description = description;
      this.address = address;
      this.blueprint = null;
      this.deed = null;
      services = new ArrayList<>();
      taxes = new ArrayList<>();
      functionalUnits = new ArrayList<>();
      totalAmount = 0;
      file = null;
   }


    public Property(String name, String description, String address, Blueprint blueprint, Deed deed) {
        this.name = name;
        this.description = description;
        this.address = address;
        this.blueprint = blueprint;
        this.deed = deed;
        services = new ArrayList<>();
        taxes = new ArrayList<>();
        functionalUnits = new ArrayList<>();
        totalAmount = 0;
        file = null;
    }

    public Integer getId() {
      return id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
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

   public List<Services> getServices() {
      return services;
   }

   public void setServices(List<Services> services) {
      this.services = services;
   }

   public List<Taxes> getTaxes() {
      return taxes;
   }

   public void setTaxes(List<Taxes> taxes) {
      this.taxes = taxes;
   }

   public List<FunctionalUnit> getFunctionalUnits() {
      return functionalUnits;
   }

   public void setFunctionalUnits(List<FunctionalUnit> functionalUnits) {
      this.functionalUnits = functionalUnits;
   }

   public Integer getTotalAmount() {
      return totalAmount;
   }

   public void setTotalAmount(Integer totalAmount) {
      this.totalAmount = totalAmount;
   }

   public List<Expenses> getExpenses() {
      return expenses;
   }

   public void setExpenses(List<Expenses> expenses) {
      this.expenses = expenses;
   }

   public File getFile() {
      return file;
   }

   public void setFile(File file) {
      this.file = file;
   }

   public Integer getTotalExpenses() {
      int result = 0;
      for(Expenses expense : expenses) {
         result += expense.getAmount();
      }
      return result;
   }
   public void addFunctionalUnit(FunctionalUnit functionalUnit) {
      functionalUnits.add(functionalUnit);
      totalAmount++;
   }

    public FunctionalUnit getSpecificFunctionalUnitById(Integer id) {
        for (FunctionalUnit functionalUnit : functionalUnits) {
            if (functionalUnit.getId().equals(id)) {
                return functionalUnit;
            } else {
                System.out.println("NOT FOUND");
            }
        } return null;
    }

   @Override
   public String toString() {
      String details = "\nNombre: " + name + "\nDireccion: "+ address + "\nDescripcion: " + description + "\nDetalles plano: " + blueprint.toString() + "" +
              "\nDetalles escritura: " + deed.toString();
//      + "\nServicios: " + servicesString + "\nImpuestos: " + taxes.toString() + "\nExpensas: " + expenses.toString();
      String functionalUnitsString = "";
      for (int i = 0; i < functionalUnits.size(); i++) {
         functionalUnitsString += functionalUnits.get(i).toString() + "\n";
      }
      return details + "\n" + functionalUnitsString;
   }
}
