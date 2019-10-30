namespace Window1
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnShowFirstForm1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnShowFirstForm1
            // 
            this.btnShowFirstForm1.Location = new System.Drawing.Point(18, 177);
            this.btnShowFirstForm1.Name = "btnShowFirstForm1";
            this.btnShowFirstForm1.Size = new System.Drawing.Size(256, 77);
            this.btnShowFirstForm1.TabIndex = 0;
            this.btnShowFirstForm1.Text = "切换第一个窗口";
            this.btnShowFirstForm1.UseVisualStyleBackColor = true;
            this.btnShowFirstForm1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlText;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.btnShowFirstForm1);
            this.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.Name = "Form2";
            this.Text = "Form2";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnShowFirstForm1;
    }
}