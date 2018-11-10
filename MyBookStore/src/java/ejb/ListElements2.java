/**
    Document   : ListElements2
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
*/
package ejb;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;


/**
 *
 * @author fakhryfauzan
 */
@Stateful

public class ListElements2 implements ListElementsRemote2 {

    List<Integer> values2 = new ArrayList<>();

    @Override
    public void addElement2(int e2) {
        values2.add(e2);
    }

    @Override
    public void removeElement2(int e2) {
      values2.remove(new Integer(e2));
    }

    @Override
    public List<Integer> getElements2() {
        return values2;
    }
    
}
