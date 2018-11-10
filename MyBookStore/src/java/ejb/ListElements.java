/**
    Document   : ListElements
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
*/
package ejb;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;

@Stateful
public class ListElements implements ListElementsRemote
{

   List<String> values = new ArrayList<>();
  
    @Override
    public void addElement(String e) {
        values.add(e);
    }

    @Override
    public void removeElement(String e) {
        values.remove(new String(e));
    }

    @Override
    public List<String> getElements() {
        return values;
    }
  
}
