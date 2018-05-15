package propertyAdmin.structure.property;

import propertyAdmin.structure.persons.Guarantor;
import propertyAdmin.structure.persons.Landlord;
import propertyAdmin.structure.persons.Tenant;

import javax.persistence.*;
import java.util.Date;

//Base de contrato Bello-Ngom-Depto1

@Entity
@Table(name = "CONTRACT")
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) @Column(name = "ID")
    private Integer id;
    @Column(name = "NAME")
    private String name;
    @Temporal(TemporalType.DATE)
    private Date dateIssued; //29/09/2017
    @Temporal(TemporalType.DATE)
    private Date contractDateStart;
    @Temporal(TemporalType.DATE)
    private Date contractDateEnd;
    @ManyToOne(cascade = {CascadeType.ALL})
    private Landlord owner; //Gabriela Fernanda Bello
    @ManyToOne(cascade = {CascadeType.ALL})
    private Tenant tenant; //Mame Gor NGOM
    @ManyToOne(cascade = {CascadeType.ALL})
    private Guarantor guarantor;
    @Column(name = "PRICE")
    private Double price;
    @Column(name = "DAILY_INTEREST_FOR_DELAYED_PAYMENT")
    private Double dailyInterestForDelayedPayment;

    public Contract() {
    }

    public Contract(String name,
                    Date dateIssued, Date contractDateStart, Date contractDateEnd, Landlord owner,
                    Tenant tenant, Guarantor guarantor, Double price, Double dailyInterestForDelayedPayment) {
        this.name = name;
        this.dateIssued = dateIssued;
        this.contractDateStart = contractDateStart;
        this.contractDateEnd = contractDateEnd;
        this.owner = owner;
        this.tenant = tenant;
        this.guarantor = guarantor;
        this.price = price;
        this.dailyInterestForDelayedPayment = dailyInterestForDelayedPayment;
    }

    public String getName() {
        return name;
    }

    public Integer getId() {
        return id;
    }

    public Date getDateIssued() {
        return dateIssued;
    }

    public Date getContractDateStart() {
        return contractDateStart;
    }

    public Date getContractDateEnd() {
        return contractDateEnd;
    }

    public Landlord getOwner() {
        return owner;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public Guarantor getGuarantor() {
        return guarantor;
    }

    public Double getPrice() {
        return price;
    }

    public Double getDailyInterestForDelayedPayment() {
        return dailyInterestForDelayedPayment;
    }

    public Landlord getLandlord() {
        return owner;
    }
}
