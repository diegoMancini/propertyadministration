package propertyAdmin.app.menu.form;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.home.HomeMenu;
import propertyAdmin.persons.Account;

public class LogInMenu extends Menu {

    public void operate() {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Llenar \n 2 - Volver");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }
            switch (choice) {
                case 1:
                    askForLoginInfo();
                    break;
                case 2:
                    break mainloop;
                default:
                    System.out.println("Ingrese opeacion correcta");
            }
        }
    }

    public void askForLoginInfo() {
        boolean rightLoginInfo = false;
        System.out.println("Ingrese los siguientes datos por favor \n");
        String mail = Scanner.getString("Mail: ").toLowerCase();
        String password = Scanner.getString("Contraseña: ");
        do {
            if (getDatabaseOps().getAccount(mail).getPassword().equals(password)) {
                Account account = getDatabaseOps().getAccount(mail);
                getDatabaseOps().getAccount(mail).setLogged(true);
                rightLoginInfo = true;
                new HomeMenu().operate(account);
            } else {
                System.out.println("Datos erroneos");
            }
        }
        while (rightLoginInfo);
    }

}
