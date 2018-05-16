package propertyAdmin.structure.property;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
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
    @Column(name = "ISSUED_DATE")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    private LocalDateTime dateIssued; //29/09/2017
    @Column(name = "START_DATE")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    private LocalDateTime contractDateStart;
    @Column(name = "END_DATE")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    private LocalDateTime contractDateEnd;
    @ManyToOne(cascade = {CascadeType.ALL})
    private Landlord owner; //Gabriela Fernanda Bello
    @ManyToOne(cascade = {CascadeType.ALL})
    private Tenant tenant; //Mame Gor NGOM
    @ManyToOne(cascade = {CascadeType.ALL})
    private Guarantor guarantor;
    @Column(name = "PRICE")
    private Integer price;
    @Column(name = "INFLATION_MONTHS_PERIOD")
    private Integer inflationMonthsPeriod;
    @Column(name = "INFLATION_RATE")
    private Integer inflationRate;
    @Column(name = "DAILY_INTEREST_FOR_DELAYED_PAYMENT")
    private Integer dailyInterestForDelayedPayment;

    public Contract() {
    }

    public Contract(String name,
                    LocalDateTime dateIssued, LocalDateTime contractDateStart, LocalDateTime contractDateEnd, Landlord owner,
                    Tenant tenant, Guarantor guarantor, Integer price, Integer dailyInterestForDelayedPayment) {
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

    public Contract(String name, LocalDateTime contractDateStart, LocalDateTime contractDateEnd, Tenant tenant, Guarantor guarantor, Integer price, Integer inflationMonthsPeriod, Integer inflationRate) {
        this.name = name;
        this.owner = null;
        this.contractDateStart = contractDateStart;
        this.contractDateEnd = contractDateEnd;
        this.tenant = tenant;
        this.guarantor = guarantor;
        this.price = price;
        this.inflationMonthsPeriod = inflationMonthsPeriod;
        this.inflationRate = inflationRate;
    }

    public String getName() {
        return name;
    }

    public Integer getId() {
        return id;
    }

    public LocalDateTime getDateIssued() {
        return dateIssued;
    }

    public LocalDateTime getContractDateStart() {
        return contractDateStart;
    }

    public LocalDateTime getContractDateEnd() {
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

    public Integer getPrice() {
        return price;
    }

    public Integer getInflationMonthsPeriod() {
        return inflationMonthsPeriod;
    }

    public Integer getInflationRate() {
        return inflationRate;
    }

    public Integer getDailyInterestForDelayedPayment() {
        return dailyInterestForDelayedPayment;
    }

    public Landlord getLandlord() {
        return owner;
    }
}
