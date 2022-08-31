package ar.com.aguaMedina.utils.html;

import java.lang.reflect.Field;
import java.util.List;

public class HtmlTable <E> /*generic (lo que decida el usuario)*/{
    public String getTable(List<E> list){
        if(list == null || list.isEmpty()){ return "<table></table>";}
        
        //<tr> = table row
        //<th> = table head
        //<td> = table date
        
        String table = "<table>";
        
        E e =list.get(0);
        Field [] campos= e.getClass().getDeclaredFields();
        table += "<tr>";
        for (Field c:campos){
            table += "<th>"+c.getName()+"</th>";
        }
        table += "</tr>";
        
        for(E x:list){
            table += "<tr>";
            for (Field c:campos){
                table += "<td>";
                String method="get"+c.getName().substring(0,1).toUpperCase()+c.getName().substring(1);
                //System.out.println(method);
                try {
                    table+=x.getClass().getDeclaredMethod(method, null).invoke(x,null);
                } catch (Exception ex) {
                    System.out.println("*********************************");
                    System.out.println(e);
                    System.out.println("*********************************");
                }
                table += "</td>";
            }
            table += "</tr>";
        }
        
        table += "</table>";
        return table;
    }

}
