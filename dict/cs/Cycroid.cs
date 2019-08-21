using System;
using System.Windows.Forms;
using System.Drawing;
using System.Collections.Generic;

/*
 * x = r(t - sin(t))
 * y = r(1 - cos(t))
 */
class CycroidForm: Form {

  private double t;
  private Point p;
  private Timer tm;

  public CycroidForm() {
    this.Text = "Cycroid";
    t = 0;
    tm = new Timer();
    tm.Interval = 10;
    tm.Start();
    tm.Tick += new EventHandler(tm_Tick);
    this.Paint += new PaintEventHandler(fm_Paint);
  }

  public void fm_Paint(Object sender, PaintEventArgs e) {
    Graphics g = e.Graphics;
    Pen dp = new Pen(Color.Black, 1);
    g.DrawEllipse(dp, p.X, p.Y, 10, 10);
  }

  public void tm_Tick(Object sender, EventArgs e) {
    t += 0.1;
    p = new Point();
    p.X = (int)(30 * (t - Math.Sin(t)));
    p.Y = (int)(30 * (1 - Math.Cos(t)));
    this.Invalidate();
  }

}

class Cycroid {

  public static void Main() {
    Application.Run(new CycroidForm());
  }

}
