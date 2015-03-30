/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.TreeMap;

/**
 *
 * @author dattr_000
 */
public class Cart {

    private static ArrayList<Product> items;

    public Cart() {
        items = new ArrayList<Product>();
    }

    public void ins(Product p) {
        items.add(p);
    }

    public void remove(int index) {
        items.remove(index);
    }
    
    public void removeall() {
        items.removeAll(items);
    }

    public int getSize() {
        return items.size();
    }

    public ArrayList<Product> getIt() {
        return items;
    }
    
    public int getIndex(String proName)
{
    for (int i = 0; i < items.size(); i++)
    {
        String auction = items.get(i).getProName();
        if (proName.equals(auction))
        {
            return i;
        }
    } 
    return -1;
}

}
