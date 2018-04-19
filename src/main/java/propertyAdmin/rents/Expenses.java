package propertyAdmin.rents;

import javax.persistence.*;

@Entity
@Table(name = "EXPENSES")
public class Expenses {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;
   @Column(name = "TYPE")
   private String type;
   @Column(name = "DESCRIPTION")
   private String description;
   @Column(name = "AMOUNT")
   private Integer amount;

   public Expenses() {
   }

   public Expenses(String type, String description, Integer amount) {
      this.type = type;
      this.description = description;
      this.amount = amount;
   }

   public Integer getId() {
      return id;
   }

   public String getType() {
      return type;
   }

   public String getDescription() {
      return description;
   }

   public Integer getAmount() {
      return amount;
   }
}
