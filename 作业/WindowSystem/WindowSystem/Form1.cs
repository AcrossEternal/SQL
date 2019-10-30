using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowSystem
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        public static int iNum = 0;
        private void button1_Click(object sender, EventArgs e)
        {
            int pass = Convert.ToInt32(textBox1.Text);
            
                if (pass == 123456)
                {
                    iNum  = 0;
                    System2 sys = new System2();
                    sys.Show();
                    this.Hide();
                }
                else
                {
                    iNum++;
                    label2.Text = "密码错误";
                    textBox1.Clear();
                    if(iNum>=3)
                    {
                        label2.Text = "对不起，您不能使用本次系统";
                        btnSystemFirst.Enabled = false;
                        Application.Exit();
                        return;
                        
                    }
                }
            
            }
    }
}
