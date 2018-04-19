package propertyAdmin.app.menu.form;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.logistic.LogisticsMenu;

public class StartMenu extends Menu {

    public void operate() {
        mainloop:
        while (true) {
            System.out.println("\n\n\n                    ————House Admin———\n" + "\n" + "Bienvenido a House-Admin, un sistema de gestión de propiedades.\n");
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Crear Cuenta \n 2 - Iniciar Sesion \n 3 - Logistics \n 4 - Salir");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }
            switch (choice) {
                case 1:
                    new SignUpMenu().operate();
                    break;
                case 2:
                    new LogInMenu().operate();
                    break;
                case 3:
                    new LogisticsMenu().operate();
                    break;
                case 4:
                    System.out.println("Gracias por usar House Admin");
                    System.exit(0);
                    break mainloop;
                default:
                    System.out.println("Ingrese operacion valida por favor");
                    break;
            }
        }
    }

}
