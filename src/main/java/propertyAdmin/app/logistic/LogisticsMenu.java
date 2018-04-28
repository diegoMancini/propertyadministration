package propertyAdmin.app.logistic;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.structure.persons.Account;

public class LogisticsMenu extends Menu {

    public void operate() {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Ver cuentas \n 2 - Ver propiedades \n 3 - Ver unidades funcionales \n 4 - Agregar cuenta \n 5 - Eliminar cuenta \n 6 - Agregar Propiedad \n 7 - Eliminar propiedad \n 8 - Agregar Unidad Funcional \n 9 - Eliminar unidad funcional \n + 10 - Volver \n");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }
            switch (choice) {
                case 1:
                    listAccountsInDatabase();
                    break;
                case 2:
                    listPropertiesInDatabase();
                    break;
                case 3:
                    listFunctionalUnitsInDatabase();
                    break;
                case 4:

                    break;
                default:
                    System.out.println("FIN");
                    break mainloop;
            }
        }
    }

    private void listAccountsInDatabase() {
        for (Account account : getDatabaseOps().getAccountsInDatabase()) System.out.println(account.toString());
    }

    private void listPropertiesInDatabase() {

    }

    private void listFunctionalUnitsInDatabase() {

    }

}
