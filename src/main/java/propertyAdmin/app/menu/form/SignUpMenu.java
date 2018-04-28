package propertyAdmin.app.menu.form;

import propertyAdmin.app.abc.Menu;
import propertyAdmin.app.abc.Scanner;
import propertyAdmin.structure.persons.Account;

public class SignUpMenu extends Menu {

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
                    askForAccountDetails();
                    break mainloop;
                case 2:
                    break mainloop;
                    default:
                        System.out.println("Ingrese opeacion correcta");
            }
        }
    }

    public void askForAccountDetails() {
        System.out.println("Ingrese los siguientes datos por favor \n");
        try {
            String name = Scanner.getString("Nombre: ");
            String surname = Scanner.getString("Apellido: ");
            String id = Scanner.getString("DNI: ");
            String nationality = Scanner.getString("Nacionalidad: " );
            String maritalStatus = Scanner.getString("Estado civil: ");
            String country = Scanner.getString("Pais: ");
            String province = Scanner.getString("Provincia: ");
            String city = Scanner.getString("Ciudad: ");
            String town = Scanner.getString("Localidad: ");
            String zipCode = Scanner.getString("Codigo postal: ");
            String address = Scanner.getString("Direccion: ");
            String phone = Scanner.getString("Telefono: ");
            String email = Scanner.getString("Mail: ").toLowerCase();
            String password = Scanner.getString("Contraseña: ");
            Account account = new Account(name, surname, id, nationality, maritalStatus, address, country, province, city, town, zipCode, phone, email, password);
            getDatabaseOps().addAccountToDatabase(account);
        } catch (Exception e) {
            System.out.println("Use otro mail");
        }
    }

}
