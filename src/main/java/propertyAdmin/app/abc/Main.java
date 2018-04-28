package propertyAdmin.app.abc;

import propertyAdmin.app.menu.form.StartMenu;
import propertyAdmin.database.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.persons.Guarantor;
import propertyAdmin.structure.persons.Landlord;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.details.Blueprint;
import propertyAdmin.structure.property.details.Deed;
import propertyAdmin.structure.property.structure.FunctionalUnit;
import propertyAdmin.structure.property.structure.Property;
import propertyAdmin.structure.property.structure.specifics.BusinessPremise;
import propertyAdmin.structure.property.structure.specifics.Garage;
import propertyAdmin.structure.property.structure.specifics.LivingPlace;
import propertyAdmin.structure.property.structure.specifics.Office;
import propertyAdmin.structure.rents.Contract;

import java.util.Calendar;
import java.util.Date;

public class Main {

    private static DatabaseOps databaseOps = DatabaseOps.getInstance();

    public static void main(String[] args) {
        Account testerAccount = new Account("Diego", "Mancini", "38931523", "Argentina",
                "Soltero", "Saravi 104 Barrio La Tranquera", "Argentina",
                "Buenos Aires" , "Pilar", "La Lonja", "1629",
                "5491154645662", "dm", "pass");
        databaseOps.addAccountToDatabase(testerAccount);

        Property testerProperty = new Property("Casa La Tranquera", "LOTE 50", "Saravi 104 Barrio La Tranquera",
                new Blueprint("Plano UF50"), new Deed("Escritura UF50", "Direccion UF50"));
        databaseOps.addPropertyToDatabase(testerAccount.getEmail(), testerProperty);

        FunctionalUnit testerFunctionalUnit = new LivingPlace("Casa 1", "Saravi 104");
        FunctionalUnit testerFunctionalUnit1 = new LivingPlace("Casa 2", "Caamano 546");
        FunctionalUnit testerFunctionalUnit2 = new Garage("Garage1", "dir2");
        FunctionalUnit testerFunctionalUnit3 = new Office("Oficina 1", "dir3");
        FunctionalUnit testerFunctionalUnit4 = new BusinessPremise("Local 1", "dir4");
        databaseOps.addFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit);
        databaseOps.addFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit1);
        databaseOps.addFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit2);
        databaseOps.addFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit3);
        databaseOps.addFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit4);

        Calendar cal1 = Calendar.getInstance();
        cal1.set(2017, 4, 31);
        Date dateIssued = cal1.getTime();

        Calendar cal2 = Calendar.getInstance();
        cal2.set(2017, 5, 1);
        Date dateStart = cal2.getTime();

        Calendar cal3 = Calendar.getInstance();
        cal3.set(2018, 4, 31);
        Date dateEnd = cal3.getTime();

        Contract testerContract1 = new Contract("Contrato casa 1", "Arg", "Bs As", "Pilar", "La Lonja",
                dateIssued, dateStart, dateEnd, new Landlord(testerAccount.getName(), testerAccount.getSurname(), testerAccount.getId()),
                new Tenant("Jose", "Mancini", "16529611"), new Guarantor("Gabriela", "Bello", "20761874"),
                25000.0, 2500.0, 5.0);
        Contract testerContract2 = new Contract("Contrato local 1", "Arg", "Bs As", "Pilar", "La Lonja",
                dateIssued, dateStart, dateEnd, new Landlord(testerAccount.getName(), testerAccount.getSurname(), testerAccount.getId()),
                new Tenant("Jose", "Mancini", "16529611"), new Guarantor("Gabriela", "Bello", "20761874"),
                50000.0, 5000.0, 5.0);

        databaseOps.addContractToFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit, testerContract1);
        databaseOps.addContractToFunctionalUnitToDatabase(testerAccount.getEmail(), testerProperty, testerFunctionalUnit4, testerContract2);

        System.out.println(dateIssued.toString());
        System.out.println(dateStart.toString());
        System.out.println(dateEnd.toString());

        new StartMenu().operate();
    }

}
