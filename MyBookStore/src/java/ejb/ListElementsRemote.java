/**
    Document   : ListElementsRemote
    Created on : Jun 1, 2018, 4:40:42 PM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
*/
package ejb;

import java.util.List;
import javax.ejb.Remote;

@Remote
public interface ListElementsRemote {
    void addElement(String e);
    void removeElement(String e);
    
    List<String> getElements();
    
}
