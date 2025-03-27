/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import javax.swing.JPanel;

public class PnviewManager {
    private final JPanel pnview;

    public PnviewManager(JPanel pnview) {
        this.pnview = pnview;
    }

    public void addFormToPnview(JPanel form) {
        pnview.removeAll();
        pnview.add(form);
        pnview.revalidate();
        pnview.repaint();
    }
}