/**
    Document   : ListElementsRemote2
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
*/
package ejb;

import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author fakhryfauzan
 */
@Remote
public interface ListElementsRemote2 {
    void addElement2(int e2);
    void removeElement2(int e2);
    
    List<Integer>getElements2();
    
}
