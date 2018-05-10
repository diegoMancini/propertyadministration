package propertyAdmin.structure.property;

import propertyAdmin.structure.rents.Expenses;
import propertyAdmin.structure.services.Services;
import propertyAdmin.structure.taxes.Taxes;

import javax.persistence.*;
import java.io.FileOutputStream;
import java.io.IOException;
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
   @Column(name = "IMAGE_LINK")
   private String imageLink;
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Services> services; //Luz, gas, tel
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Taxes> taxes;
   @CollectionTable @OneToMany
   private List<FunctionalUnit> functionalUnits;
   @OneToMany(cascade = {CascadeType.ALL})
   private List<Expenses> expenses;
   @Column(name = "ADDRESS")
   private String address;
   @Column(name = "VALUE")
   private String value;
   @Column(name = "IS_DELETED")
   private boolean isDeleted;
   @Column(name = "AMOUNT_OF_FUNCTIONAL_UNITS")
   private Integer amountFunctionalUnits;
   @Column(name = "AMOUNT_OF_OCCUPIED_FUNCTIONAL_UNITS")
   private Integer amountOccupied;

   public Property() {
   }

   public Property(String name, String description, String address, String value) {
      this.name = name;
      this.description = description;
      this.address = address;
      this.value = value;
      functionalUnits = new ArrayList<>();
      services = new ArrayList<>();
      taxes = new ArrayList<>();
      isDeleted = false;
      amountOccupied = 0;
      amountFunctionalUnits = 0;
      imageLink = "";
   }

   public Integer getOccupiedFunctionalUnits() {
      amountOccupied = functionalUnits.size();
      for (FunctionalUnit functionalUnit : functionalUnits) {
         if (!functionalUnit.hasContract()) {
            amountOccupied--;
         }
      }
      return amountOccupied;
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

   public Integer getAvailableFunctionalUnits() {
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

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public void setValue(String value) {
        this.value = value;
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
      String details = "\nNombre: " + name + "\nDireccion: "+ address + "\nDescripcion: " + description;
//      + "\nServicios: " + servicesString + "\nImpuestos: " + taxes.toString() + "\nExpensas: " + expenses.toString();
      String functionalUnitsString = "";
      for (int i = 0; i < functionalUnits.size(); i++) {
         functionalUnitsString += functionalUnits.get(i).toString() + "\n";
      }
      return details + "\n" + functionalUnitsString;
   }

    public String getValue() {
        return value;
    }

}
