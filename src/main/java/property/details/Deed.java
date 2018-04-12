package property.details;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "DEED")
public class Deed {

   @Column(name = "LEGAL_ADDRESS")
   private String legalAddress;


}
