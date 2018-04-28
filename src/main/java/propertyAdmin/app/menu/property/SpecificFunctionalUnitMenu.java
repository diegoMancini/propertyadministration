package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.persons.Guarantor;
import propertyAdmin.structure.persons.Landlord;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.structure.FunctionalUnit;
import propertyAdmin.structure.property.structure.Property;
import propertyAdmin.structure.rents.Contract;

import java.util.Calendar;
import java.util.Date;

public class SpecificFunctionalUnitMenu extends SpecificPropertyMenu {

   public void operate(Account account, Property aProperty, FunctionalUnit functionalUnit) {
      mainloop:
      while (true) {
         System.out.println("\n\n-----------");
         System.out.println("\nOperaciones: \n 1 - Detalles unidad funcional \n 2 - Agregar Contrato \n 3 - Ver contrato \n 4 - Quitar contrato \n 5 - Volver \n");
         int choice = Scanner.getInt("\nOperacion: ");

         //Hace clear la terminal
         for (int i = 0; i < 50; i++) {
            System.out.println("\n");
         }

         switch (choice) {
            case 1:
               System.out.println(functionalUnit.toString());
               break;
            case 2:
               addContract(account, aProperty, functionalUnit);
               break;
            case 3:
               displayContractDetails(account, aProperty, functionalUnit);
               break;
            case 4:
               removeContract(account, aProperty, functionalUnit);
               break;
            case 5:
               break mainloop;
               default:
                  System.out.println("ERROR");
                  break;
         }
      }

   }

   private void addContract(Account account, Property aProperty, FunctionalUnit functionalUnit) {
      System.out.println("\nDATOS CONTRATO: ");
      String name = Scanner.getString("Nombre: ");
      String country = Scanner.getString("Pais: ");
      String province= Scanner.getString("Provincia: ");
      String city= Scanner.getString("Ciudad: ");
      String town= Scanner.getString("Localidad: ");
      int dateIssuedYear = Scanner.getInt("Ano realizacion contrato: ");
      int dateIssuedMonth = Scanner.getInt("Mes realizacion contrato: ");
      int dateIssuedDay = Scanner.getInt("Dia realizacion contrato: ");
      Calendar cal1 = Calendar.getInstance();
      cal1.set(Calendar.YEAR, dateIssuedYear);
      cal1.set(Calendar.MONTH, dateIssuedMonth);
      cal1.set(Calendar.DAY_OF_MONTH, dateIssuedDay);
      Date dateIssued = cal1.getTime();
      int dateContractStartsYear = Scanner.getInt("Ano inicio contrato: ");
      int dateContractStartsMonth = Scanner.getInt("Mes inicio contrato: ");
      int dateContractStartsDay = Scanner.getInt("Dia inicio contrato: ");
      Calendar cal2 = Calendar.getInstance();
      cal1.set(Calendar.YEAR, dateContractStartsYear);
      cal1.set(Calendar.MONTH, dateContractStartsMonth);
      cal1.set(Calendar.DAY_OF_MONTH, dateContractStartsDay);
      Date dateStart = cal2.getTime();
      int dateContractEndsYear = Scanner.getInt("Ano inicio contrato: ");
      int dateContractEndsMonth = Scanner.getInt("Mes inicio contrato: ");
      int dateContractEndsDay = Scanner.getInt("Dia inicio contrato: ");
      Calendar cal3 = Calendar.getInstance();
      cal1.set(Calendar.YEAR, dateContractEndsYear);
      cal1.set(Calendar.MONTH, dateContractEndsMonth);
      cal1.set(Calendar.DAY_OF_MONTH, dateContractEndsDay);
      Date dateEnd = cal3.getTime();
      Double price = Scanner.getDouble("Precio total: ");
      Double deposit = Scanner.getDouble("Valor deposito");
      Double dailyInterest = Scanner.getDouble("Interes por demora pago diario:");
      System.out.println("\nDATOS INQUILINO");
      String tenantName = Scanner.getString("Nombre inquilino: ");
      String tenantSurname = Scanner.getString("Apellido inquilino: ");
      String tenantID = Scanner.getString("DNI inquilino: ");
      System.out.println("\nDATOS GARANTE");
      String guarantorName = Scanner.getString("Nombre garante: ");
      String guarantorSurname = Scanner.getString("Apellido garante: ");
      String guarantorID = Scanner.getString("DNI garante: ");
      Landlord landlord = new Landlord(account.getName(), account.getSurname(), account.getId());
      Tenant tenant = new Tenant(tenantName, tenantSurname, tenantID);
      Guarantor guarantor = new Guarantor(guarantorName, guarantorSurname, guarantorID);
      Contract contract = new Contract(name, country, province, city, town, dateIssued, dateStart, dateEnd,landlord, tenant, guarantor, price, deposit, dailyInterest);
      getDatabaseOps().addContractToFunctionalUnitToDatabase(account.getEmail(), aProperty, functionalUnit, contract);
   }

   private String displayContractDetails(Account account, Property aProperty, FunctionalUnit functionalUnit) {
        return getDatabaseOps().displayContractDetailsDatabase(account.getEmail(), aProperty, functionalUnit);
   }

   private void removeContract(Account account, Property aProperty, FunctionalUnit functionalUnit) {
        getDatabaseOps().removeContractFromFunctionalUnit(account.getEmail(), aProperty, functionalUnit);
   }

}
