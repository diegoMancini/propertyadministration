package propertyAdmin.app.menu.form;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.app.logistic.Logistics;

public class StartMenu extends Menu {

    public void operate() {
        mainloop:
        while (true) {
            System.out.println("-----------");
            System.out.println("Operaciones: \n 1 - Iniciar Sesion \n 2 - Crear Cuenta \n 3 - Logistics \n 4 - Salir");
            int choice = Scanner.getInt("Operacion: ");

            //Hace clear la terminal
            for (int i = 0; i < 50; i++) {
                System.out.println("\n");
            }
            switch (choice) {
                case 1:
                    new LogInMenu().operate();
                    break;
                case 2:
                    new SignUpMenu().operate();
                    break;
                case 3:
                    new Logistics().operate();
                    break;
                case 4:
                    System.out.println("Gracias por usar House Admin");
                    break mainloop;
                default:
                    System.out.println("Ingrese operacion valida por favor");
            }
        }
    }

}
