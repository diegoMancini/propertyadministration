package propertyAdmin.app.menu.home;

import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.economy.EconomyMenu;
import propertyAdmin.app.menu.form.LogInMenu;
import propertyAdmin.app.menu.property.PropertyMenu;
import propertyAdmin.structure.persons.Account;

public class HomeMenu extends LogInMenu {

    public void operate(Account account) {
        mainloop:
        while (true) {
            System.out.println("\n-----------");
            System.out.println("Bienvenido a su HOMEPAGE " + account.getName() + " " + account.getSurname() + "\n");
            System.out.println("Operaciones: \n 1 - Propiedades \n 2 - Economia \n 3 - Salir de la sesion");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }

            switch (choice) {
                case 1:
                    new PropertyMenu().operate(account);
                    break;
                case 2:
                    new EconomyMenu().operate(account);
                    break;
                case 3:
                    break mainloop;
                default:
                    System.out.println("Ingrese una operacion valida porfavor.");
            }
        }
    }
}
