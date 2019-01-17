using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WFAppli
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           /* MessageBox.Show("Premier composant WinForm");
            textBox2.Text = "Message dans TextBox 2";*/
        }

        private void btnProcess_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtWidth.Text))
                lblMessageWidth.Visible = true;
            else
                lblMessageWidth.Visible = false;

            if (string.IsNullOrEmpty(txtLength.Text))
                lblMessageLength.Visible = true;
            else
                lblMessageLength.Visible = false;

            if (!string.IsNullOrEmpty(txtLength.Text) && !string.IsNullOrEmpty(txtWidth.Text))
            {
                int length = int.Parse(txtLength.Text);
                int width = int.Parse(txtWidth.Text);
                txtArea.Text = (length * width).ToString();
                txtPerimeter.Text = ((length + width) * 2).ToString();
            }
        }
    }
}
