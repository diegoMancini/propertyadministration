package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.persons.Account;
import propertyAdmin.persons.Guarantor;
import propertyAdmin.persons.Tenant;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;
import propertyAdmin.rents.Contract;

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
      String dateIssued= Scanner.getString("Dia realizacion contrato: ");
      String dateStart = Scanner.getString("Dia comienzo contrato: ");
      String dateEnd= Scanner.getString("Dia finalizacion contrato: ");
      Integer price = Scanner.getInt("Precio total: ");
      Integer deposit = Scanner.getInt("Valor deposito");
      Float dailyInterest = Scanner.getFloat("Interes por demora pago diario:");
      System.out.println("\nDATOS INQUILINO");
      String tenantName = Scanner.getString("Nombre inquilino: ");
      String tenantSurname = Scanner.getString("Apellido inquilino: ");
      String tenantID = Scanner.getString("DNI inquilino: ");
      System.out.println("\nDATOS GARANTE");
      String guarantorName = Scanner.getString("Nombre garante: ");
      String guarantorSurname = Scanner.getString("Apellido garante: ");
      String guarantorID = Scanner.getString("DNI garante: ");
      Tenant tenant = new Tenant(tenantName, tenantSurname, tenantID);
      Guarantor guarantor = new Guarantor(guarantorName, guarantorSurname, guarantorID);
      Contract contract = new Contract(name, country, province, city, town, dateIssued, dateStart, dateEnd,account, tenant, guarantor, price, deposit, dailyInterest);
      getDatabaseOps().addContractToFunctionalUnitToDatabase(account.getEmail(), aProperty, functionalUnit, contract);
   }

   private void displayContractDetails(Account account, Property aProperty, FunctionalUnit functionalUnit) {

   }

   private void removeContract(Account account, Property aProperty, FunctionalUnit functionalUnit) {

   }

}
