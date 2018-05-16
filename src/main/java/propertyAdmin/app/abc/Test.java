package propertyAdmin.app.abc;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.Property;

import java.util.List;

public class Test {

   public static void main(String[] args) {
      List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties("diego@mail.com");
      Account account = DatabaseOps.getInstance().getAccount("diego@mail.com");
      if (propertyList.size() > 0) {
         for (int i = 0; i < propertyList.size(); i++) {
            String name = propertyList.get(i).getName();
            System.out.println(name);
            Integer fu = propertyList.get(i).getFunctionalUnits().size();
            System.out.println(fu);
            String nameAcc = account.getFullName();
            System.out.println(nameAcc);
            String addressAcc = account.getFullAddress();
            System.out.println(addressAcc);
            if (propertyList.get(i).getFunctionalUnits().size() > 0) {
               for (int j = 0; j < propertyList.get(i).getFunctionalUnits().size(); j++) {
                  String state = propertyList.get(i).getFunctionalUnits().get(j).getState();
                  String client = "";
                  Double price = 0.0;
                  String contractName = "";
                  if (state.equals("Ocupado")) {
                     client += propertyList.get(i).getFunctionalUnits().get(j).getContract().getTenant().getFullName();
                     System.out.println(client);
                     price += propertyList.get(i).getFunctionalUnits().get(j).getContract().getPrice();
                     System.out.println(price);
                     contractName += propertyList.get(i).getFunctionalUnits().get(j).getContract().getName();
                     System.out.println(contractName);
                  } else {
                     client += "------";
                     System.out.println(client);
                     contractName += "------";
                     System.out.println(contractName);
                  }
               }
            }
            if (propertyList.get(i).getOccupiedFunctionalUnits()> 0) {
               for (int k = 0; k < propertyList.get(i).getOccupiedFUList().size(); k++) {
                  String contractName = propertyList.get(i).getOccupiedFUList().get(k).getContract().getName();
                  System.out.println(contractName);
                  String startDate = propertyList.get(i).getOccupiedFUList().get(k).getContract().getContractDateStart().toString();
                  System.out.println(startDate);
                  String endDate = propertyList.get(i).getOccupiedFUList().get(k).getContract().getContractDateEnd().toString();
                  System.out.println(endDate);
                  Tenant tenant = propertyList.get(i).getOccupiedFUList().get(k).getContract().getTenant();
                  System.out.println(tenant.getName());
//                  Double price = propertyList.get(i).getOccupiedFUList().get(k).getContract().getPrice();
//                  System.out.println(price);
               }
            }
            if (propertyList.get(i).getOccupiedFunctionalUnits() > 0) {
               for (int l = 0; l < propertyList.get(i).getTenantList().size(); l++) {
                  String tenantName = propertyList.get(i).getTenantList().get(l).getFullName();
                  System.out.println(tenantName);
                  String tenantID = propertyList.get(i).getTenantList().get(l).getDni();
                  System.out.println(tenantID);
                  String phone = propertyList.get(i).getTenantList().get(l).getPhone();
                  System.out.println(phone);
                  String email = propertyList.get(i).getTenantList().get(l).getEmail();
                  System.out.println(email);
                  String tenantNationality = propertyList.get(i).getTenantList().get(l).getNationality();
                  System.out.println(tenantNationality);
                  String[] addressList = {propertyList.get(i).getTenantList().get(l).getAddress(), propertyList.get(i).getTenantList().get(l).getAddressTown(), propertyList.get(i).getTenantList().get(l).getAddressCity(), propertyList.get(i).getTenantList().get(l).getAddressProvince(), propertyList.get(i).getTenantList().get(l).getAddressCountry(), propertyList.get(i).getTenantList().get(l).getAddressZipCode()};
               }
            }
         }
      }
   }

}
