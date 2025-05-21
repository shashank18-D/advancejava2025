//1. Develop a Swing program in Java to display a message “Digital Clock is pressed” or “Hour
//Glass is pressed” depending upon the Jbutton with image either Digital Clock or Hour Glass is
//pressed by implementing the event handling mechanism with addActionListener( ).
package Swings;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ClockUI extends JFrame implements ActionListener {

    private JLabel messageLabel;
    private JButton digitalBtn, hourGlassBtn;

    public ClockUI() {
        setTitle("Clock Button Example");
        setSize(600, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout(20, 20));

        // Message Label at the top
        messageLabel = new JLabel("Click a button below", SwingConstants.CENTER);
        messageLabel.setFont(new Font("Arial", Font.BOLD, 20));
        add(messageLabel, BorderLayout.NORTH);

        // Panel for image buttons
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 50, 10));

        // Load images
        ImageIcon digitalIcon = new ImageIcon("digital_clock.png");
        ImageIcon hourGlassIcon = new ImageIcon("hour_glass.png");

        // Create image buttons
        digitalBtn = new JButton(digitalIcon);
        hourGlassBtn = new JButton(hourGlassIcon);

        // Set borderless and background clean
        digitalBtn.setBorderPainted(false);
        digitalBtn.setContentAreaFilled(false);
        hourGlassBtn.setBorderPainted(false);
        hourGlassBtn.setContentAreaFilled(false);

        // Add action listeners
        digitalBtn.addActionListener(this);
        hourGlassBtn.addActionListener(this);

        // Add buttons to panel
        buttonPanel.add(digitalBtn);
        buttonPanel.add(hourGlassBtn);

        // Add panel to frame
        add(buttonPanel, BorderLayout.CENTER);

        // Show the frame
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == digitalBtn) {
            messageLabel.setText("You have pressed digital clock!");
        } else if (e.getSource() == hourGlassBtn) {
            messageLabel.setText("You have pressed hour glass!");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new ClockUI());
    }
}

