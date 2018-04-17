package propertyAdmin.app.menu.property;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;

public class SpecificFunctionalUnitMenu {

   public void operate(Account account, Property aProperty, FunctionalUnit functionalUnit) {
      mainloop:
      while (true) {
         System.out.println("\n\n-----------");
         System.out.println("\nOperaciones: \n 1 - Detalles unidad funcional \n 2 - Ver contrato \n 3 - Agregar Contrato \n 4 - Quitar contrato \n 5 - Volver \n");
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
               displayContractDetails(account, aProperty, functionalUnit);
               break;
            case 3:
               addContract(account, aProperty, functionalUnit);
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

   private void displayContractDetails(Account account, Property aProperty, FunctionalUnit functionalUnit) {

   }

   private void addContract(Account account, Property aProperty, FunctionalUnit functionalUnit) {

   }

   private void removeContract(Account account, Property aProperty, FunctionalUnit functionalUnit) {

   }

}
