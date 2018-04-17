package propertyAdmin.app.menu.form;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.menu.home.HomeMenu;

public class LogInMenu extends Menu {

    private String mail;
    private String password;

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
        mail = Scanner.getString("Mail: ");
        password = Scanner.getString("Contraseña: ");
        do {
            if (getDatabaseOps().getUser(mail).getEmail().equals(password)) {
                rightLoginInfo = true;
                new HomeMenu().operate();
            } else {
                System.out.println("Datos erroneos");
            }
        }
        while (rightLoginInfo);
    }

    public String getMail() {
        return mail;
    }

    public String getPassword() {
        return password;
    }
}
