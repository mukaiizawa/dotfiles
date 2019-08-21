using System;
using System.Windows.Forms;
using System.Drawing;

class ClockForm: Form {

  private Label lb;
  private Timer tm;

  public ClockForm() {
    this.Text = "Clock";
    this.Width = 250;
    this.Height = 100;
    lb = new Label();
    lb.Font = new Font("Courier", 40, FontStyle.Regular);
    lb.Dock = DockStyle.Fill;
    lb.Parent = this;
    tm = new Timer();
    tm.Interval = 1000;
    tm.Start();
    tm.Tick += new EventHandler(tm_Tick);
  }

  public void tm_Tick(Object sender, EventArgs e) {
    lb.Text = DateTime.Now.ToLongTimeString();
  }

}

class Clock {

  public static void Main() {
    Application.Run(new ClockForm());
  }

}
