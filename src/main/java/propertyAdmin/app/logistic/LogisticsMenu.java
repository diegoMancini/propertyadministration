package propertyAdmin.app.logistic;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.persons.Account;

import java.util.List;

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
                case 2:
                case 3:
                case 4:
                case 5:
                    String email = Scanner.getString("Email: ");
                    getDatabaseOps().removeAccountFromDatabase(email);
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                    default:

            }
        }
    }

    private void listAccountsInDatabase() {
        List<Account> accounts = getDatabaseOps().getAccountsInDatabase();
        for (Account account : accounts) System.out.println(account.toString());
    }

}
