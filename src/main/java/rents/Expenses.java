package rents;

import javax.persistence.*;

@Entity
@Table(name = "EXPENSES")
public class Expenses {

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
   private Integer id;

   public Expenses() {
   }
}
