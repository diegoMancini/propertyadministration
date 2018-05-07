package propertyAdmin.structure.property.structure;

import propertyAdmin.structure.property.details.Blueprint;
import propertyAdmin.structure.property.details.Deed;
import propertyAdmin.structure.rents.Expenses;
import propertyAdmin.structure.services.Services;
import propertyAdmin.structure.taxes.Taxes;

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
   private Integer amountFunctionalUnits;
   @Column(name = "AMOUNT_OF_OCCUPIED_FUNCTIONAL_UNITS")
   private Integer amountOccupied;
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Expenses> expenses;
   @Column(name = "IMAGE")
   private File file;
   @Column(name = "IS_DELETED")
   private boolean isDeleted;
   @Column(name = "VALUE")
   private Double value;

   public Property() {
   }

   public Property(String name, String description, String address, Double value) {
      this.name = name;
      this.description = description;
      this.address = address;
      this.blueprint = null;
      this.deed = null;
      services = new ArrayList<>();
      taxes = new ArrayList<>();
      functionalUnits = new ArrayList<>();
      amountFunctionalUnits = 0;
      file = null;
      isDeleted = false;
      amountOccupied = 0;
      this.value = value;
   }

   public Integer getAmountOccupied() {
      amountOccupied = functionalUnits.size();
      for (FunctionalUnit functionalUnit : functionalUnits) {
         if (!functionalUnit.hasContract()) {
            amountOccupied--;
         }
      }
      return amountOccupied;
   }

   public Property(String name, String description, String address, Blueprint blueprint, Deed deed, Double value) {
        this.name = name;
        this.description = description;
        this.address = address;
        this.blueprint = blueprint;
        this.deed = deed;
        services = new ArrayList<>();
        taxes = new ArrayList<>();
        functionalUnits = new ArrayList<>();
        amountFunctionalUnits = 0;
        file = null;
        this.value = value;
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

   public Integer getAmountFunctionalUnits() {
      return amountFunctionalUnits;
   }

   public void setAmountFunctionalUnits(Integer totalAmount) {
      this.amountFunctionalUnits = totalAmount;
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
      amountFunctionalUnits++;
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

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    public void deleteFunctionalUnit(FunctionalUnit functionalUnit) {
       functionalUnit.setDeleted(true);
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

    public double getValue() {
        return value;
    }
}
